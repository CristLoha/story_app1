import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app1/data/model/story/story.dart';
part 'stories_response.g.dart';
part 'stories_response.freezed.dart';

@freezed
class StoriesResponse with _$StoriesResponse {
  const factory StoriesResponse({
    required bool error,
    required String message,
    required List<Story> listStory,
  }) = _StoriesResponse;

  factory StoriesResponse.fromJson(json) => _$StoriesResponseFromJson(json);
}
