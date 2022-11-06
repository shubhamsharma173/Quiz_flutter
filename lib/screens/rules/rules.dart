import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/screens/video_player/video_player.dart';
import '../../../screens/leaderboard/leaderboard.dart';

class RulesScreen extends StatelessWidget {
  QuestionController _qnController = Get.put(QuestionController());

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
                // Flutter show the back button automatically
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  TextButton(
                      onPressed: () => {Get.to(LeaderboardScreen())},
                      child: Text("Leaderboard")),
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
                            onTap: () =>
                                {_qnController.onClose(), Get.to(()=>VideoPlayerWidget())},
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
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    .copyWith(color: Colors.black),
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
