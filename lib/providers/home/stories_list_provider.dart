import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:story_app1/data/api/api_service.dart';
import 'package:story_app1/data/model/stories_response.dart';
import 'package:story_app1/static/stories_result_state.dart';

class StoriesListProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  StoriesResultState _resultState = StoriesNoneState();
  StoriesResultState get resultState => _resultState;

  Future<void> fetchStories(String token) async {
    _resultState = StoriesLoadingState();
    notifyListeners();

    try {
      final response = await _apiService.getStories(token: token);
      final storiesResponse = StoriesResponse.fromJson(response);

      if (!storiesResponse.error) {
        _resultState = StoriesLoadedState(storiesResponse.listStory);
      } else {
        _resultState = StoriesErrorState(storiesResponse.message);
      }
    } on SocketException {
      _resultState = StoriesErrorState(
        "No internet connection. Please check your network.",
      );
    } on TimeoutException {
      _resultState = StoriesErrorState(
        "The request took too long. Please try again later.",
      );
    } catch (e) {
      _resultState = StoriesErrorState(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
