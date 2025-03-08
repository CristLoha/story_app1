import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:story_app1/data/api/api_service.dart';
import 'package:story_app1/services/sesion_manager.dart';
import 'package:story_app1/static/upload_result_state.dart';

class UploadPostProvider extends ChangeNotifier {
  XFile? imageFile;
  String? imagePath;
  String description = '';

  final ApiService _apiService = ApiService();
  final SessionManager _sessionManager = SessionManager();
  UploadResultState _state = UploadNoneState();

  UploadResultState get state => _state;

  void setImageFile(XFile? value) {
    imageFile = value;
    notifyListeners();
  }

  void setImagePath(String? path) {
    imagePath = path;
    notifyListeners();
  }

  void setDescription(String value) {
    description = value;
    notifyListeners();
  }

  Future<void> uploadStory({double? lat, double? lon}) async {
    if (imageFile == null || description.isEmpty) return;

    _state = UploadLoadingState();
    notifyListeners();

    try {
      final token = await _sessionManager.getToken();
      if (token == null) throw Exception("User is not logged in");

      // Baca file asli
      Uint8List originalBytes = await imageFile!.readAsBytes();

      // Resize & compress image
      List<int> resizedBytes = await resizeImage(originalBytes);
      List<int> compressedBytes = await compressImage(resizedBytes);

      // Simpan file sementara
      XFile processedFile = await saveTemporaryFile(
        Uint8List.fromList(compressedBytes),
        imageFile!.name,
      );

      // **Set path setelah file diproses**
      setImagePath(processedFile.path);

      // Upload ke API
      await _apiService.uploadStory(
        description,
        processedFile,
        token,
        lat: lat,
        lon: lon,
      );

      _state = UploadSuccessState();
    } catch (e) {
      _state = UploadErrorState(e.toString());
    }

    notifyListeners();
  }

  Future<List<int>> resizeImage(List<int> bytes) async {
    if (bytes.length < 1000000) return bytes;

    final img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;
    bool isWidthMoreTaller = image.width > image.height;
    int imageTall = isWidthMoreTaller ? image.width : image.height;
    double compressTall = 1;
    List<int> newBytes = bytes;

    do {
      compressTall -= 0.1;
      final newImage = img.copyResize(
        image,
        width: isWidthMoreTaller ? (imageTall * compressTall).toInt() : null,
        height: !isWidthMoreTaller ? (imageTall * compressTall).toInt() : null,
      );
      newBytes = img.encodeJpg(newImage);
    } while (newBytes.length > 1000000);

    return newBytes;
  }

  Future<List<int>> compressImage(List<int> bytes) async {
    if (bytes.length < 1000000) return bytes;

    final img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;
    int compressQuality = 100;
    List<int> newBytes = [];

    do {
      compressQuality -= 10;
      newBytes = img.encodeJpg(image, quality: compressQuality);
    } while (newBytes.length > 1000000 && compressQuality > 10);

    return newBytes;
  }

  Future<XFile> saveTemporaryFile(Uint8List bytes, String fileName) async {
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/$fileName');
    await tempFile.writeAsBytes(bytes);
    return XFile(tempFile.path);
  }

  void clearImage() {
    imageFile = null;
    imagePath = null;
    notifyListeners();
  }
}
