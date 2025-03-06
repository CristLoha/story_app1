class RegisterResponse {
  final bool error;
  final String message;

  RegisterResponse({required this.error, required this.message});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(error: json["error"], message: json["message"]);
  }
}
