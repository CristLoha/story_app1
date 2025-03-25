import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_result_state.freezed.dart';


@freezed
class RegisterResultState with _$RegisterResultState {
  const factory RegisterResultState.initial() = RegisterInitialState;
  const factory RegisterResultState.loading() = RegisterLoadingState;
  const factory RegisterResultState.loaded(String message) = RegisterLoadedState;
  const factory RegisterResultState.error(String message) = RegisterErrorState;
}
