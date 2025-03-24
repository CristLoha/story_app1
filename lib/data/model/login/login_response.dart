import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app1/data/model/login/login.dart';
part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required bool error,
    required String message,
    Login? loginResult,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(json) => _$LoginResponseFromJson(json);
}
