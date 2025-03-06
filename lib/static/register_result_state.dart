sealed class RegisterResultState {}

class RegisterInitialState extends RegisterResultState {}

class RegisterLoadingState extends RegisterResultState {}

class RegisterSuccessState extends RegisterResultState {
  final String message;

  RegisterSuccessState(this.message);
}

class RegisterErrorState extends RegisterResultState {
  final String message;
  RegisterErrorState(this.message);
}
