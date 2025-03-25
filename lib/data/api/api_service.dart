import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:story_app1/data/model/login/login_response.dart';
import 'package:story_app1/data/model/register/register_response.dart';
import 'package:story_app1/data/model/story/stories_response.dart';
import 'package:story_app1/data/model/upload/upload_response.dart';

class ApiService {
  static const String baseUrl = "https://story-api.dicoding.dev/v1";

  final http.Client client;
  ApiService(this.client);
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

  Future<UploadResponse> uploadStory(
    String description,
    XFile image,
    String token, {
    double? lat,
    double? lon,
  }) async {
    final url = Uri.parse('$baseUrl/stories');

    var request =
        http.MultipartRequest('POST', url)
          ..headers['Authorization'] = 'Bearer $token'
          ..fields['description'] = description;

    if (lat != null && lon != null) {
      request.fields['lat'] = lat.toString();
      request.fields['lon'] = lon.toString();
    }

    request.files.add(await http.MultipartFile.fromPath('photo', image.path));
    final response = await request.send();
    final responseData = await response.stream.bytesToString();
    final data = jsonDecode(responseData);

    if (response.statusCode == 201) {
      return UploadResponse.fromJson(data);
    } else {
      throw Exception(data["message"]);
    }
  }

  Future<StoriesResponse> getStories({
    required String token,
    int page = 1,
    int size = 10,
    int? location,
  }) async {
    final uri = Uri.parse('$baseUrl/stories').replace(
      queryParameters: {
        'page': page.toString(),
        'size': size.toString(),
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

    if (response.statusCode == 200) {
      return StoriesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to fetch stories: ${response.body}");
    }
  }
}
