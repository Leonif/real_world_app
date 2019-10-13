import 'package:flutter/material.dart';
import 'package:real_world_app/Entities/VideoFeedEntity.dart';
import './Views/VideoCell.dart';
import './UseCases/VideoFeedUseCase.dart';

void main() => runApp(RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RealWorlState();
  }
}

class RealWorlState extends State<RealWorldApp> {
  var _isLoading = false;
  var _feed = VideoFeedEntity(videos: []);
  var useCase = VideoFeedUseCase();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() {
    useCase.fetchPost().then((value) {
      setState(() {
        _isLoading = false;
        _feed = value;

        var r = _feed.videos != null ? _feed.videos : "No data";
        print(r);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text("Real world app"),
              actions: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.refresh),
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                    });
                    _loadData();
                  },
                )
              ],
            ),
            body: Center(
                child: _isLoading
                    ? new CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: this._feed.videos.length,
                        itemBuilder: (context, i) {
                          final video = this._feed.videos[i];
                          return new Column(children: <Widget>[
                            new FlatButton(
                              padding: EdgeInsets.all(0),
                              child: new VideoCell(video),
                              onPressed: () {
                                print("selected!!!");
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => VideoDetail()));
                              },
                            ),
                            new Divider()
                          ]);
                        },
                      ))));
  }
}

class VideoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Video Detail")),
      body: Text("Body detail"),
    );
  }
}
