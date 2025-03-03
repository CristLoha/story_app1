import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

class HomeProvider with ChangeNotifier {
  bool _isExpanded = false; // State untuk ekspansi teks
  Reaction<String>? _selectedReaction; // State untuk reaksi yang dipilih

  bool get isExpanded => _isExpanded;
  Reaction<String>? get selectedReaction => _selectedReaction;

  // Toggle ekspansi teks
  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  // Mengubah reaksi yang dipilih
  void updateSelectedReaction(Reaction<String>? reaction) {
    _selectedReaction =
        (_selectedReaction?.value == reaction?.value) ? null : reaction;
    notifyListeners();
  }
}