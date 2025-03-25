import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:story_app1/data/api/api_service.dart';
import 'package:story_app1/services/sesion_manager.dart';
import 'package:story_app1/static/state/login/login_result_state.dart';
import 'package:story_app1/static/state/register/register_result_state.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService(Client());
  final SessionManager _sesionManager = SessionManager();

  LoginResultState _loginState = LoginResultState.initial();
  RegisterResultState _registerState = RegisterResultState.initial();

  LoginResultState get loginState => _loginState;
  RegisterResultState get registerStete => _registerState;

  Future<void> checkLoginStatus() async {
    final isLoggedIn = await _sesionManager.isLoggedIn();
    if (isLoggedIn) {
      final token = await _sesionManager.getToken();
      final userId = await _sesionManager.getUserId();
      final name = await _sesionManager.getName();

      if (token != null && userId != null && name != null) {
        _loginState = LoginResultState.loaded(
          userId: userId,
          name: name,
          token: token,
        );
        notifyListeners();
      }
    } else {
      _loginState = LoginResultState.initial();
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      _loginState = LoginResultState.error(
        "Please enter both email and password.",
      );
      notifyListeners();
      return;
    }
    _loginState = LoginResultState.loading();
    notifyListeners();
    try {
      final response = await _apiService.login(email, password);

      if (!response.error && response.loginResult != null) {
        await _sesionManager.saveSession(
          response.loginResult!.token,
          response.loginResult!.userId,
          response.loginResult!.name,
        );

        _loginState = LoginResultState.loaded(
          userId: response.loginResult!.userId,
          name: response.loginResult!.name,
          token: response.loginResult!.token,
        );
      } else {
        _loginState = LoginResultState.error(response.message);
      }
    } on SocketException {
      _loginState = LoginResultState.error(
        "No internet connection. Please check your network.",
      );
    } on TimeoutException {
      _loginState = LoginResultState.error(
        "The request took too long. Please try again later.",
      );
    } on FormatException {
      _loginState = LoginResultState.error(
        "Unexpected error. Please restart the app.",
      );
    } catch (e) {
      final errorMessage = e.toString().replaceAll("Exception: ", "").trim();
      _loginState = LoginResultState.error(errorMessage);
    } finally {
      notifyListeners();
    }
  }

  Future<void> register(String name, String email, String password) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _registerState = RegisterResultState.error("Please fill in all fields.");
      notifyListeners();
      return;
    }

    _registerState = RegisterResultState.loading();
    notifyListeners();

    try {
      final response = await _apiService.register(name, email, password);

      if (!response.error) {
        _registerState = RegisterResultState.loaded(response.message);
        notifyListeners();
      } else {
        _registerState = RegisterResultState.loaded(response.message);
      }
    } on SocketException {
      _registerState = RegisterResultState.error(
        "No internet connection. Please check your network.",
      );
    } on TimeoutException {
      _registerState = RegisterResultState.error(
        "The request took too long. Please try again later.",
      );
    } on FormatException {
      _registerState = RegisterResultState.error(
        "Unexpected error. Please restart the app.",
      );
    } catch (e) {
      final errorMessage = e.toString().replaceAll("Exception: ", "").trim();
      _registerState = RegisterResultState.error(errorMessage);
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _sesionManager.clearSession();
    _loginState = LoginResultState.initial();
    notifyListeners();
  }

  void resetState() {
    _loginState = LoginResultState.initial();
    notifyListeners();
  }
}
