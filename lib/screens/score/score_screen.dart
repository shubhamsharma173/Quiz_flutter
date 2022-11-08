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
    String getBG() {
      if (_qnController.numOfCorrectAns == 1) {
        return "assets/images/2.png";
      } else if (_qnController.numOfCorrectAns == 2) {
        return "assets/images/3.png";
      } else if (_qnController.numOfCorrectAns == 3) {
        return "assets/images/4.png";
      } else if (_qnController.numOfCorrectAns == 4) {
        return "assets/images/5.png";
      } else if (_qnController.numOfCorrectAns == 5) {
        return "assets/images/6.png";
      } else {
        return "assets/images/1.png";
      }
    }

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(getBG()),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
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
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  Spacer(flex: 1),
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
          ),
        ));
  }
}
