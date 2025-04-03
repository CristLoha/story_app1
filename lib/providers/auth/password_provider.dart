import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  bool _isObscured = true;

  bool get isObscure => _isObscured;

  void toggleVisibility() {
    _isObscured = !_isObscured;
    notifyListeners();
  }
}
