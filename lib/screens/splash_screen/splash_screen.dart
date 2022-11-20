import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';

import '../../constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // three second of delay for splash screen to display and the redirect to home
    Timer(Duration(seconds: 3), gotoHome);
  }

  gotoHome() {
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
          builder: (BuildContext context) => WelcomeScreen(),
        ),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/landing.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: null);
  }
}
