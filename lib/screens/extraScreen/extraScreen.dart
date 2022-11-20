import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../constants.dart';
import '../../../screens/welcome/welcome_screen.dart';
import '../../../screens/leaderboard/leaderboard.dart';
import '../../controllers/question_controller.dart';
import '../quiz/quiz_screen.dart';

class ExtraScreen extends StatefulWidget {
  @override
  _ExtraScreenState createState() => _ExtraScreenState();
}

class _ExtraScreenState extends State<ExtraScreen> {
  VideoPlayerController _vController;
  Future<void> _initializeVideoPlayerFuture;
  QuestionController _qnController = Get.put(QuestionController());

  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _vController = VideoPlayerController.asset("assets/video/extraScreen.mp4");
    _initializeVideoPlayerFuture = _vController.initialize();

    _vController.play();
    _vController.setLooping(true);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => {Get.deleteAll(), Get.to(WelcomeScreen())},
            child: Icon(
              Icons.home_filled, // add custom icons also
            ),
          ),
          automaticallyImplyLeading: false,
          // Flutter show the back button automatically
          backgroundColor: Colors.transparent,
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
        body: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: FittedBox(
                // If your background video doesn't look right, try changing the BoxFit property.
                // BoxFit.fill created the look I was going for.
                fit: BoxFit.fill,
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: VideoPlayer(_vController),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: new BoxDecoration(
                color: Colors.white.withAlpha(1),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(flex: 3),
                    InkWell(
                      onTap: () => {
                        _vController.dispose(),
                        _qnController.onClose(),
                        Get.to(QuizScreen()),
                      },
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
                          "Let's Go",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Spacer(flex: 3),
                    // it will take 2/6 spaces
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _vController.dispose();
  }
}
