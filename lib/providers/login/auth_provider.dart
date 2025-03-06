import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:story_app1/data/api/api_service.dart';

import 'package:story_app1/services/sesion_manager.dart';
import 'package:story_app1/static/login_result_state.dart';
import 'package:story_app1/static/register_result_state.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  final SessionManager _sesionManager = SessionManager();

  LoginResultState _loginState = LoginInitialState();
  RegisterResultState _registerState = RegisterInitialState();

  LoginResultState get loginState => _loginState;
  RegisterResultState get registerStete => _registerState;

  Future<void> checkLoginStatus() async {
    final isLoggedIn = await _sesionManager.isLoggedIn();
    if (isLoggedIn) {
      final token = await _sesionManager.getToken();
      final userId = await _sesionManager.getUserId();
      final name = await _sesionManager.getName();

      if (token != null && userId != null && name != null) {
        _loginState = LoginSuccessState(
          userId: userId,
          name: name,
          token: token,
        );
        notifyListeners();
      }
    } else {
      _loginState = LoginInitialState();
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      _loginState = LoginErrorState("Please enter both email and password.");
      notifyListeners();
      return;
    }
    _loginState = LoginLoadingState();
    notifyListeners();
    try {
      final response = await _apiService.login(email, password);

      if (!response.error && response.loginResult != null) {
        await _sesionManager.saveSession(
          response.loginResult!.token,
          response.loginResult!.userId,
          response.loginResult!.name,
        );

        _loginState = LoginSuccessState(
          userId: response.loginResult!.userId,
          name: response.loginResult!.name,
          token: response.loginResult!.token,
        );
      } else {
        _loginState = LoginErrorState(response.message);
      }
    } on SocketException {
      _loginState = LoginErrorState(
        "No internet connection. Please check your network.",
      );
    } on TimeoutException {
      _loginState = LoginErrorState(
        "The request took too long. Please try again later.",
      );
    } on FormatException {
      _loginState = LoginErrorState(
        "Unexpected error. Please restart the app.",
      );
    } catch (e) {
      final errorMessage = e.toString().replaceAll("Exception: ", "").trim();
      _loginState = LoginErrorState(errorMessage);
    } finally {
      notifyListeners();
    }
  }

  Future<void> register(String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _registerState = RegisterErrorState("Please fill in all fields.");
      notifyListeners();
      return;
    }

    _registerState = RegisterLoadingState();
    notifyListeners();

    try {
      final response = await _apiService.register(name, email, password);

      if (!response.error) {
        _registerState = RegisterSuccessState(response.message);
        notifyListeners();
      } else {
        _registerState = RegisterErrorState(response.message);
      }
    } on SocketException {
      _registerState = RegisterErrorState(
        "No internet connection. Please check your network.",
      );
    } on TimeoutException {
      _registerState = RegisterErrorState(
        "The request took too long. Please try again later.",
      );
    } on FormatException {
      _registerState = RegisterErrorState(
        "Unexpected error. Please restart the app.",
      );
    } catch (e) {
      final errorMessage = e.toString().replaceAll("Exception: ", "").trim();
      _registerState = RegisterErrorState(errorMessage);
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _sesionManager.clearSession();
    _loginState = LoginInitialState();
    notifyListeners();
  }

  void resetState() {
    _loginState = LoginInitialState();
    notifyListeners();
  }
}
