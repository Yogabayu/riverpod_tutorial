import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';
import '../../utils/navigate.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimeout() {
    return new Timer(Duration(seconds: 2), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    Navigate.pushPageReplacement(context, HomeScreen());
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/black_icon.png",
              color: Theme.of(context).textTheme.titleLarge!.color,
              height: 150,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
