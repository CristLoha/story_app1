import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:story_app1/data/model/login_response.dart';
import 'package:story_app1/data/model/register_response.dart';

class ApiService {
  static const String baseUrl = "https://story-api.dicoding.dev/v1";
  Future<LoginResponse> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(data);
    } else {
      throw Exception(data["message"]);
    }
  }

  Future<RegisterResponse> register(
    String name,
    String email,
    String password,
  ) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email, "password": password}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return RegisterResponse.fromJson(data);
    } else {
      throw Exception(data["message"]);
    }
  }

  Future<Map<String, dynamic>> getStories({
    required String token,
    int? page,
    int? size,
    int? location,
  }) async {
    final uri = Uri.parse('$baseUrl/stories').replace(
      queryParameters: {
        if (page != null) 'page': page.toString(),
        if (size != null) 'size': size.toString(),
        if (location != null) 'location': location.toString(),
      },
    );
    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data["message"]);
    }
  }
}
