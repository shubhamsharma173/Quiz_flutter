import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../controllers/question_controller.dart';
import '../../../screens/welcome/welcome_screen.dart';
import '../../../screens/leaderboard/leaderboard.dart';
import 'package:quiz_app/controllers/data_controller.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    DataController _controller = Get.put(DataController());

    _controller.submitScore();
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
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
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  Spacer(flex: 4),
                  Text(
                    "Score",
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: kSecondaryColor),
                  ),
                  Spacer(flex: 1),
                  Text(
                    "${_qnController.numOfCorrectAns * 20}/${_qnController.questions.length * 20}",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: kSecondaryColor),
                  ),
                  Spacer(),
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
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(flex: 4),
                ],
              )
            ],
          ),
        ));
  }
}
