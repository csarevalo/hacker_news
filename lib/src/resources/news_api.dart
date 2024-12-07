import 'dart:convert';

import 'package:hacker_news/src/models/item_model.dart';
import 'package:http/http.dart' show Client;

import '../models/comment_model.dart';
import '../models/story_model.dart';

const _apiBaseUrl = 'https://hacker-news.firebaseio.com/v0';

/// Network Handler for Hacker News Api.
class NewsApi {
  final Client _client;

  NewsApi({Client? client}) : _client = client ?? Client();

  /// Fetch the ids of the Top Stories.
  Future<List<int>> fetchTopStoryIds() async {
    final response = await _client.get(
      Uri.parse('$_apiBaseUrl/topstories.json'),
    );
    if (response.statusCode != 200) {
      throw Exception(
        'Failed Hacker News API request with status code ${response.statusCode}',
      );
    }
    final ids = json.decode(response.body);
    return ids.cast<int>();
  }

  /// Fetch Item from api
  Future<ItemModel> fetchItem(int id) async {
    final response = await _client.get(Uri.parse('$_apiBaseUrl/item/$id.json'));
    if (response.statusCode != 200) {
      throw Exception(
        'Failed Hacker News API request with status code ${response.statusCode}',
      );
    }
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }

  /// Fetch a story from api
  Future<StoryModel> fetchStory(int id) async {
    final response = await _client.get(Uri.parse('$_apiBaseUrl/item/$id.json'));
    if (response.statusCode != 200) {
      throw Exception(
        'Failed Hacker News API request with status code ${response.statusCode}',
      );
    }
    final parsedJson = json.decode(response.body);
    return StoryModel.fromJson(parsedJson);
  }

  /// Fetch a story from api
  Future<CommentModel> fetchComment(int id) async {
    final response = await _client.get(Uri.parse('$_apiBaseUrl/item/$id.json'));
    if (response.statusCode != 200) {
      throw Exception(
        'Failed Hacker News API request with status code ${response.statusCode}',
      );
    }
    final parsedJson = json.decode(response.body);
    return CommentModel.fromJson(parsedJson);
  }
}
