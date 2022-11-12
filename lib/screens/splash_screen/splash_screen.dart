import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/icons/ic_launcher.png'),
      ),
    );
  }
}
