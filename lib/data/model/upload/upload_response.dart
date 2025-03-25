import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_response.g.dart';
part 'upload_response.freezed.dart';

@freezed
class UploadResponse with _$UploadResponse {
  const factory UploadResponse({required bool error, required String message}) =
      _AssetResponse;

  factory UploadResponse.fromJson(json) => _$UploadResponseFromJson(json);
}
