import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../constants.dart';
import '../../../controllers/question_controller.dart';
import '../../../screens/welcome/welcome_screen.dart';
import '../../../screens/leaderboard/leaderboard.dart';
import 'package:quiz_app/controllers/data_controller.dart';

class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  // TODO 4: Create a VideoPlayerController object.
  VideoPlayerController _vController;
  Future<void> _initializeVideoPlayerFuture;
  QuestionController _qnController = Get.put(QuestionController());

  String getBG() {
    if (_qnController.numOfCorrectAns == 1) {
      return "assets/video/2.mp4";
    } else if (_qnController.numOfCorrectAns == 2) {
      return "assets/video/3.mp4";
    } else if (_qnController.numOfCorrectAns == 3) {
      return "assets/video/4.mp4";
    } else if (_qnController.numOfCorrectAns == 4) {
      return "assets/video/5.mp4";
    } else if (_qnController.numOfCorrectAns == 5) {
      return "assets/video/6.mp4";
    } else {
      return "assets/video/1.mp4";
    }
  }

  // TODO 5: Override the initState() method and setup your VideoPlayerController
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _vController = VideoPlayerController.asset(getBG());
    _initializeVideoPlayerFuture = _vController.initialize();

    _vController.play();
    _vController.setLooping(false);
    _vController.addListener(() {
      if (_vController.value.position == _vController.value.duration &&
          _vController.value.duration > Duration(seconds: 1)) {
        print('background video Ended-------------------');
        _vController.seekTo(Duration(
          milliseconds: 15000,
        ));
      }
    });
    setState(() {});
    // ..initialize().then((_) {
    //   // Once the video has been loaded we play the video and set looping to true.
    //   _vController.play();
    //   _vController.setLooping(false);
    //   // Ensure the first frame is shown after the video is initialized.
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // Flutter show the back button automatically
          backgroundColor: Colors.white.withOpacity(0.01),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.leaderboard,
                color: Colors.white,
              ),
              onPressed: () => {Get.to(LeaderboardScreen())},
            )
          ],
        ),
        // TODO 6: Create a Stack Widget
        body: Stack(
          children: <Widget>[
            // TODO 7: Add a SizedBox to contain our video.
            SizedBox.expand(
              child: FittedBox(
                // If your background video doesn't look right, try changing the BoxFit property.
                // BoxFit.fill created the look I was going for.
                fit: BoxFit.fill,
                child: SizedBox(
                  width:  100,
                  height: 100,
                  child: VideoPlayer(_vController),
                ),
              ),
            ),
            ScoreScreen()
          ],
        ),
      ),
    );
  }

  // TODO 8: Override the dispose() method to cleanup the video controller.
  @override
  void dispose() {
    super.dispose();
    _vController.dispose();
  }
}

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    DataController _controller = Get.put(DataController());

    _controller.submitScore();

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        decoration: new BoxDecoration(
          color: Colors.white.withAlpha(1),
          // borderRadius: new BorderRadius.only(
          //   topLeft: const Radius.circular(10.0),
          //   topRight: const Radius.circular(10.0),
          //   bottomLeft: const Radius.circular(10.0),
          //   bottomRight: const Radius.circular(10.0),
          // ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Score",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Colors.white),
                ),
                Text(
                  "${_qnController.numOfCorrectAns * 20}/${_qnController.questions.length * 20}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Colors.white),
                ),
                Spacer(flex: 6),
                InkWell(
                  onTap: () => {Get.deleteAll(), Get.to(WelcomeScreen())},
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(kDefaultPadding * 0.75),
                    // 15
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      "Play again",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 18),
                    ),
                  ),
                ),
                Spacer(flex: 1),
              ],
            )
          ],
        ));
  }
}
