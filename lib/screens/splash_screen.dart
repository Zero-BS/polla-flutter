import 'package:flutter/material.dart';
import 'package:polla/constants.dart';

class SplashScreen extends StatelessWidget {
  static final String id = 'splash_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeColor,
      body: Center(
        child: Container(
          height: 200,
          child: Image.asset('images/splash.png'),
        ),
      ),
    );
  }
}
