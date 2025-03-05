import 'package:story_app1/data/model/login_result.dart';

class LoginResponse {
  final bool error;
  final String message;
  final LoginResult? loginResult;

  LoginResponse({required this.error, required this.message, this.loginResult});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      error: json['error'],
      message: json['message'],
      loginResult:
          json['loginResult'] != null
              ? LoginResult.fromJson(json['loginResult'])
              : null,
    );
  }
}
