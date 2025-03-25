import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_result_state.freezed.dart';

@freezed
class LoginResultState with _$LoginResultState {
  const factory LoginResultState.initial() = LoginResultStateInitial;
  const factory LoginResultState.loading() = LoginLoadingState;
  const factory LoginResultState.error(String message) = LoginErrorState;
  const factory LoginResultState.loaded({
    required String userId,
    required String name,
    required String token,
  }) = LoginLoadedState;
}
