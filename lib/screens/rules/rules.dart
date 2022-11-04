import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
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
                  TextButton(onPressed: () =>
                  {Get.to(LeaderboardScreen())}, child: Text("Leaderboard")),
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
                          //2/6
                          Text(
                            "Rules",
                            style: Theme.of(context).textTheme.headline4.copyWith(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Spacer(), // 1/6
                          InkWell(
                            onTap: () => Get.to(QuizScreen()),
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
