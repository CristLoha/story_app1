import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:story_app1/data/api/api_service.dart';
import 'package:story_app1/static/auth_state.dart';
import 'package:story_app1/services/sesion_manager.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  final SessionManager _sesionManager = SessionManager();

  AuthState _state = AuthInitialState();
  AuthState get state => _state;

  Future<void> checkLoginStatus() async {
    final isLoggedIn = await _sesionManager.isLoggedIn();
    if (isLoggedIn) {
      final token = await _sesionManager.getToken();
      final userId = await _sesionManager.getUserId();
      final name = await _sesionManager.getName();

      if (token != null && userId != null && name != null) {
        _state = AuthSuccessState(userId: userId, name: name, token: token);
        notifyListeners();
      }
    } else{
      _state  = AuthInitialState();
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      _state = AuthErrorState("Please enter both email and password.");
      notifyListeners();
      return;
    }
    _state = AuthLoadingState();
    notifyListeners();
    try {
      final response = await _apiService.login(email, password);

      if (!response.error && response.loginResult != null) {
        await _sesionManager.saveSession(
          response.loginResult!.token,
          response.loginResult!.userId,
          response.loginResult!.name,
        );

        _state = AuthSuccessState(
          userId: response.loginResult!.userId,
          name: response.loginResult!.name,
          token: response.loginResult!.token,
        );
      } else {
        _state = AuthErrorState(response.message);
      }
    } on SocketException {
      _state = AuthErrorState(
        "No internet connection. Please check your network.",
      );
    } on TimeoutException {
      _state = AuthErrorState(
        "The request took too long. Please try again later.",
      );
    } on FormatException {
      _state = AuthErrorState("Unexpected error. Please restart the app.");
    } catch (e) {
      final errorMessage = e.toString().replaceAll("Exception: ", "").trim();
      _state = AuthErrorState(errorMessage);
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _sesionManager.clearSession();
    _state = AuthInitialState();
    notifyListeners();
  }
}
