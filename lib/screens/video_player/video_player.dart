import 'package:flutter/material.dart';
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
        VideoPlayerController.network(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        );
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _videoPlayerController.play();
  }

  @override
  void dispose() {
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
