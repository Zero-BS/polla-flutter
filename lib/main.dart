import 'package:flutter/material.dart';
import 'package:polla/constants.dart';
import 'package:polla/screens/home_screen.dart';

void main() => runApp(Polla());

class Polla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(primaryColor: kThemeColor),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
