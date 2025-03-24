import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:story_app1/data/api/api_service.dart';
import 'package:story_app1/data/model/story/story.dart';
import 'package:story_app1/static/stories_result_state.dart';

class StoriesListProvider with ChangeNotifier {
  final ApiService _apiService;
  StoriesListProvider(this._apiService);

  int _currentPage = 1;
  final int _sizeItems = 10;
  bool _hasMoreData = true;
  bool _isFetching = false;

  bool get isFetching => _isFetching;
  bool get hasMoreData => _hasMoreData;

  StoriesResultState _resultState = StoriesResultState.initial();
  StoriesResultState get resultState => _resultState;

  String? _token;
  String? get token => _token;

  final List<Story> _stories = [];
  List<Story> get stories => List.unmodifiable(_stories);

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  Future<void> fetchStories() async {
    if (_token == null) return;

    bool hasInternet = await _checkInternetConnection();
    if (!hasInternet) {
      _resultState = StoriesResultState.error(
        "No internet connection. Please check your network.",
      );
      notifyListeners();
      return;
    }

    _currentPage = 1;
    _hasMoreData = true;
    _stories.clear();
    _isFetching = true;
    notifyListeners();

    try {
      _resultState = StoriesResultState.loading();
      notifyListeners();

      final result = await _apiService.getStories(
        token: _token!,
        page: _currentPage,
        size: _sizeItems,
      );

      _stories.addAll(result.listStory);
      _hasMoreData = result.listStory.length == _sizeItems;
      _resultState = StoriesResultState.loaded(_stories);
    } catch (e) {
      _resultState = StoriesResultState.error(
        "Failed to fetch stories. Please try again.",
      );
    }

    _isFetching = false;
    notifyListeners();
  }

  Future<void> fetchMoreStories() async {
    if (_token == null || _isFetching || !_hasMoreData) return;

    bool hasInternet = await _checkInternetConnection();
    if (!hasInternet) {
      _resultState = StoriesResultState.error(
        "No internet connection. Please check your network.",
      );
      notifyListeners();
      return;
    }

    _isFetching = true;
    notifyListeners();

    try {
      _currentPage++;
      final result = await _apiService.getStories(
        token: _token!,
        page: _currentPage,
        size: _sizeItems,
      );

      if (result.listStory.isNotEmpty) {
        _stories.addAll(result.listStory);
        _hasMoreData = result.listStory.length == _sizeItems;
      } else {
        _hasMoreData = false;
      }
    } catch (e) {
      _hasMoreData = false;
    }

    _isFetching = false;
    notifyListeners();
  }

  Future<void> refreshStories() async {
    await fetchStories();
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
