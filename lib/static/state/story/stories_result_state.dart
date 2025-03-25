import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app1/data/model/story/story.dart';

part 'stories_result_state.freezed.dart';
@freezed
class StoriesResultState with _$StoriesResultState {
  const factory StoriesResultState.initial() = StoriesResultStateInitial;
  const factory StoriesResultState.loading() = StoriesResultStateLoading;
  const factory StoriesResultState.loaded(List<Story> data) =
      StoriesResultStateLoaded;
  const factory StoriesResultState.error(String message) =
      StoriesResultStateError;
}
