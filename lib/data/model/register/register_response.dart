import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    required bool error,
    required String message,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(json) => _$RegisterResponseFromJson(json);
}
