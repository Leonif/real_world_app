import 'package:flutter/material.dart';
import 'package:real_world_app/Entities/VideoEntity.dart';


class VideoCell extends StatelessWidget {
  final VideoEntity video;

  VideoCell(this.video);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Image.network(video.imageUrl),
              new Container(height: 8),
              new Row(
                children: <Widget>[
                  new Icon(Icons.refresh),
                  new Text(
                    video.name,
                    style: new TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ]));
  }
}