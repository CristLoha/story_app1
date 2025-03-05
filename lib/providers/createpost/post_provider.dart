import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

class PostProvider extends ChangeNotifier {
  String? imagePath;
  XFile? imageFile;
  String description = '';

  final Map<String, bool> _expandedPosts = {}; // Simpan ekspansi per post
  final Map<String, Reaction<String>?> _selectedReactions = {}; // Simpan reaksi per post

  // Getter
  bool isExpanded(String postId) => _expandedPosts[postId] ?? false;
  Reaction<String>? getSelectedReaction(String postId) => _selectedReactions[postId];

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
        (_selectedReactions[postId]?.value == reaction?.value) ? null : reaction;
    notifyListeners();
  }

  
}
