import 'package:real_world_app/Entities/VideoEntity.dart';

class VideoFeedEntity {
  final List<VideoEntity> videos ;

  VideoFeedEntity({this.videos});

  factory VideoFeedEntity.fromJson(Map<String, dynamic> json) {
    final List<VideoEntity> output = [];

    json["videos"].forEach((video) {
      output.add(VideoEntity.fromJson(video));
    });
    return VideoFeedEntity(videos: output);
  }
}
