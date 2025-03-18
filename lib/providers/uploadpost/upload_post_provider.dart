import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
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

  final ApiService _apiService = ApiService(Client());
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
    bool hasInternet = await _checkInternetConnection();
    if (!hasInternet) {
      _state = UploadErrorState(
        "No internet connection. Please check your network and try again.",
      );
      notifyListeners();
      return;
    }

    _state = UploadLoadingState();
    notifyListeners();

    try {
      final token = await _sessionManager.getToken();
      if (token == null) {
        throw Exception("Session expired. Please log in again.");
      }

      Uint8List originalBytes = await imageFile!.readAsBytes();

      List<int> resizedBytes = await compute(
        _resizeImageIsolate,
        originalBytes,
      );
      List<int> compressedBytes = await compute(
        _compressImageIsolate,
        resizedBytes,
      );

      XFile processedFile = await saveTemporaryFile(
        Uint8List.fromList(compressedBytes),
        imageFile!.name,
      );

      setImagePath(processedFile.path);

      await _apiService.uploadStory(
        description,
        processedFile,
        token,
        lat: lat,
        lon: lon,
      );

      _state = UploadSuccessState();
    } catch (e) {
      String errorMessage;

      if (e.toString().contains("Session expired")) {
        errorMessage = "Session expired. Please log in again.";
      } else if (e.toString().contains("upload failed")) {
        errorMessage = "Failed to upload image. Please try again later.";
      } else {
        errorMessage = "Something went wrong. Please try again later.";
      }

      _state = UploadErrorState(errorMessage);
    }

    notifyListeners();
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final result = await Socket.connect(
        'google.com',
        80,
        timeout: Duration(seconds: 3),
      );
      result.destroy();
      return true;
    } catch (_) {
      return false;
    }
  }

  static List<int> _resizeImageIsolate(List<int> bytes) {
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

  static List<int> _compressImageIsolate(List<int> bytes) {
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
