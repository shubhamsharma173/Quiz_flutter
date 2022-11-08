import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/data_controller.dart';
import 'package:quiz_app/screens/rules/rules.dart';
import '../../../screens/leaderboard/leaderboard.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  WelcomeScreenState createState() => new WelcomeScreenState();
}

class WelcomeScreenState extends State {
  DataController _controller = Get.put(DataController());

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
                          //2/6
                          // Text(
                          //   "Let's Play Quiz,",
                          //   style: Theme.of(context).textTheme.headline4.copyWith(
                          //       color: Colors.white, fontWeight: FontWeight.bold),
                          // ),
                          // Text("Enter your details below"),
                          // Spacer(), // 1/6
                          TextField(
                            controller: _controller.textController_1,
                            onChanged: (val) {
                              this.setState(() {
                                _controller.buttonEnabled =
                                    _controller.checkTextFieldEmpty();
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF1C2341),
                              hintText: "Full Name",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                          Spacer(),
                          TextField(
                            controller: _controller.textController_2,
                            onChanged: (val) {
                              this.setState(() {
                                _controller.buttonEnabled =
                                    _controller.checkTextFieldEmpty();
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF1C2341),
                              hintText: "Mobile No.",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                          Spacer(),
                          // 1/6
                          TextField(
                            controller: _controller.textController_3,
                            onChanged: (val) {
                              this.setState(() {
                                _controller.buttonEnabled =
                                    _controller.checkTextFieldEmpty();
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF1C2341),
                              hintText: "City",
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: _controller.buttonEnabled
                                ? () => {Get.to(RulesScreen())}
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                            ),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(kDefaultPadding * 0.75),
                              // 15
                              decoration: BoxDecoration(
                                gradient: _controller.buttonEnabled
                                    ? kPrimaryGradient
                                    : kSecondaryGradient,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Text(
                                "Register",
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
