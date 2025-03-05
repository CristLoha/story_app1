import 'package:story_app1/data/model/story_model.dart';

class StoriesResponse {
  final bool error;
  final String message;
  final List<StoryModel> listStory;

  StoriesResponse({
    required this.error,
    required this.message,
    required this.listStory,
  });

  factory StoriesResponse.fromJson(Map<String, dynamic> json) {
    return StoriesResponse(
      error: json['error'],
      message: json['message'],
      listStory: List<Map<String, dynamic>>.from(json['listStory'])
          .map((storyJson) => StoryModel.fromJson(storyJson))
          .toList(),
    );
  }
}