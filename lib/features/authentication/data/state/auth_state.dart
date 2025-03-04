sealed class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final String userId;
  final String name;
  final String token;

  AuthSuccessState({
    required this.userId,
    required this.name,
    required this.token,
  });
}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState(this.message);
}
