import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_result_state.freezed.dart';

@freezed
 class UploadResultState with _$UploadResultState {
  const factory UploadResultState.none() = UploadNoneState;
  const factory UploadResultState.loading() = UploadLoadingState;
  const factory UploadResultState.error(String message) = UploadErrorState;
  const factory UploadResultState.loaded() = UploadLoadedState;
 }
