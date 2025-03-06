sealed class LoginResultState {}

class LoginInitialState extends LoginResultState {}

class LoginLoadingState extends LoginResultState {}

class LoginSuccessState extends LoginResultState {
  final String userId;
  final String name;
  final String token;

  LoginSuccessState({
    required this.userId,
    required this.name,
    required this.token,
  });
}

class LoginErrorState extends LoginResultState {
  final String message;
  LoginErrorState(this.message);
}
