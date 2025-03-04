import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool _isMenuVisible = false;

  bool get isMenuVisible => _isMenuVisible;

  void toggleMenu() {
    _isMenuVisible = !_isMenuVisible;
    notifyListeners();
  }
}
