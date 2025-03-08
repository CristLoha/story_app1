import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:story_app1/data/api/api_service.dart';
import 'package:story_app1/services/sesion_manager.dart';
import 'package:story_app1/static/upload_result_state.dart';

class UploadPostProvider extends ChangeNotifier {
  String? imagePath;
  XFile? imageFile;
  String description = '';

  final ApiService _apiService = ApiService();
  final SessionManager _sessionManager = SessionManager();
  UploadResultState _state = UploadNoneState();

  UploadResultState get state => _state;

  final Map<String, bool> _expandedPosts = {};
  final Map<String, Reaction<String>?> _selectedReactions =
      {}; // Simpan reaksi per post

  // Getter
  bool isExpanded(String postId) => _expandedPosts[postId] ?? false;
  Reaction<String>? getSelectedReaction(String postId) =>
      _selectedReactions[postId];

  // Setters
  void setImagePath(String? value) {
    imagePath = value;
    notifyListeners();
  }

  void setImageFile(XFile? value) {
    imageFile = value;
    notifyListeners();
  }

  void setDescription(String value) {
    description = value;
    notifyListeners();
  }

  // Toggle ekspansi per post
  void toggleExpanded(String postId) {
    _expandedPosts[postId] = !isExpanded(postId);
    notifyListeners();
  }

  // Mengubah reaksi yang dipilih
  void updateSelectedReaction(String postId, Reaction<String>? reaction) {
    _selectedReactions[postId] =
        (_selectedReactions[postId]?.value == reaction?.value)
            ? null
            : reaction;
    notifyListeners();
  }

  Future<void> uploadStory({double? lat, double? lon}) async {
    if (imageFile == null || description.isEmpty) return;

    _state = UploadLoadingState();
    notifyListeners();
    try {
      final token = await _sessionManager.getToken();
      if (token == null) {
        throw Exception("User is not logged in");
      }
      await _apiService.uploadStory(
        description,
        imageFile!,
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

  void clearImage() {
    imageFile = null;
    imagePath = null;
    notifyListeners();
  }
}
