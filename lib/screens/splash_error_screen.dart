import 'package:flutter/material.dart';

class SplashErrorScreen extends StatelessWidget {
  final VoidCallback onRetryPressed;

  SplashErrorScreen({@required this.onRetryPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Something went wrong!'),
            FlatButton(onPressed: onRetryPressed, child: Text('Retry'))
          ],
        ),
      ),
    );
  }
}
