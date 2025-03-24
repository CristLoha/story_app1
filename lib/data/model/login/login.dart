import 'package:freezed_annotation/freezed_annotation.dart';
part 'login.g.dart';
part 'login.freezed.dart';

@freezed
class Login with _$Login {
  const factory Login({
    required String userId,
    required String name,
    required String token,
  }) = _Login;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
}
