import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/video_player/video_player.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import '../../../screens/leaderboard/leaderboard.dart';

class RulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/rulesbg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
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
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(flex: 6),
                          InkWell(
                            onTap: () => Get.to(VideoPlayerWidget()),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(kDefaultPadding * 0.75),
                              // 15
                              decoration: BoxDecoration(
                                gradient: kPrimaryGradient,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Text(
                                "Lets Start Quiz",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          Spacer(flex: 2),
                          // it will take 2/6 spaces
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
