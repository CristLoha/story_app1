import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:story_app1/data/api/api_service.dart';
import 'package:story_app1/static/stories_result_state.dart';

class StoriesListProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  StoriesResultState _resultState = StoriesNoneState();
  StoriesResultState get resultState => _resultState;

  Future<void> fetchStories(String token) async {
    bool hasInternet = await _checkInternetConnection();
    if (!hasInternet) {
      _resultState = StoriesErrorState(
        "No internet connection\nPlease check your network",
      );
      notifyListeners();
      return;
    }

    _resultState = StoriesLoadingState();
    notifyListeners();

    try {
      final storiesResponse = await _apiService
          .getStories(token: token)
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              throw TimeoutException(
                "The request took too long. Please try again later.",
              );
            },
          );

      if (!storiesResponse.error) {
        _resultState = StoriesLoadedState(storiesResponse.listStory);
      } else {
        _resultState = StoriesErrorState(storiesResponse.message);
      }
    } on TimeoutException {
      _resultState = StoriesErrorState(
        "The request took too long. Please try again later.",
      );
    } catch (e) {
      _resultState = StoriesErrorState(
        "Something went wrong. Please try again.",
      );
    } finally {
      notifyListeners();
    }
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final result = await Socket.connect(
        'google.com',
        80,
        timeout: Duration(seconds: 3),
      );
      result.destroy();
      return true;
    } catch (_) {
      return false;
    }
  }
}
