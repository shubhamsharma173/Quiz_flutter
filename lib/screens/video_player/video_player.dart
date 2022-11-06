import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:get/get.dart';

class VideoPlayerWidget extends StatefulWidget {

  @override
  _VideoPlayerState createState() => new _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerWidget> {
  QuestionController _qnController = Get.put(QuestionController());

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
        _qnController.onClose();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  QuizScreen()));
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
