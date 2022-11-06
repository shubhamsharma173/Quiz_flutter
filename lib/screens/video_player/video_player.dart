import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/screens/score/score_screen.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class VideoPlayerWidget extends StatefulWidget {
  @override
  _VideoPlayerState createState() => new _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerWidget> {
  VideoPlayerController _videoPlayerController;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        VideoPlayerController.asset(
          'assets/video/product.mp4',
        );
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

    _videoPlayerController.play();
    _videoPlayerController.addListener(() {
      if(_videoPlayerController.value.position == _videoPlayerController.value.duration && _videoPlayerController.value.duration > Duration(seconds: 1)) {
        print('video Ended-------------------');
        dispose();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  ScoreScreen()));
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VideoPlayer(_videoPlayerController),
    );
  }
}
