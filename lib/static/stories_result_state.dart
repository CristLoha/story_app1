import 'package:story_app1/data/model/story_model.dart';

sealed class StoriesResultState {}

class StoriesNoneState extends StoriesResultState {}

class StoriesLoadingState extends StoriesResultState {}

class StoriesErrorState extends StoriesResultState {
  final String message;
  StoriesErrorState(this.message);
}

class StoriesLoadedState extends StoriesResultState {
  final List<StoryModel> data;
  StoriesLoadedState(this.data);
}
