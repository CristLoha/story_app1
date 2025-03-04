import 'package:flutter/material.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';

class PasswordProvider extends ChangeNotifier {
  bool _isObscured = true;
  String _passwordStrength = '';
  Color _strengthColor = ColorsManager.grey900;

  bool get isObscure => _isObscured;
  String get passwordStrength => _passwordStrength;
  Color get strengthColor => _strengthColor;

  void toggleVisibility() {
    _isObscured = !_isObscured;
    notifyListeners();
  }

  void checkPasswordStrength(String password) {
    if (password.isEmpty) {
      _passwordStrength = '';
      _strengthColor = ColorsManager.grey900;
    } else if (password.length <= 8) {
      _passwordStrength = 'Weak';
      _strengthColor = ColorsManager.red;
    } else if (RegExp(r'^(?=.*[A-Z])(?=.*\d)').hasMatch(password)) {
      _passwordStrength = 'Strong';
      _strengthColor = ColorsManager.green;
    } else {
      _passwordStrength = 'Medium';
      _strengthColor = ColorsManager.orangeMedium;
    }
    notifyListeners();
  }
}
