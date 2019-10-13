import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:real_world_app/Entities/VideoFeedEntity.dart';

class VideoFeedUseCase {
  Future<VideoFeedEntity> fetchPost() async {
    final response =
        await http.get('https://api.letsbuildthatapp.com/youtube/home_feed');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return VideoFeedEntity.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}