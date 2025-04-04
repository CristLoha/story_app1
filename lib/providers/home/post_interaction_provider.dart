import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

class PostInteractionProvider extends ChangeNotifier {
  final Map<String, bool> _expandedPosts = {};
  final Map<String, Reaction<String>?> _selectedReactions = {};

  bool isExpanded(String postId) => _expandedPosts[postId] ?? false;
  Reaction<String>? getSelectedReaction(String postId) =>
      _selectedReactions[postId];

  void toggleExpanded(String postId) {
    _expandedPosts[postId] = !isExpanded(postId);
    notifyListeners();
  }

  void updateSelectedReaction(String postId, Reaction<String>? reaction) {
    _selectedReactions[postId] =
        (_selectedReactions[postId]?.value == reaction?.value)
            ? null
            : reaction;
    notifyListeners();
  }
}
