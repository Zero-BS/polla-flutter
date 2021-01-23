// @dart=2.9
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<FirebaseApp> futureFirebaseApp;

  @override
  void initState() {
    super.initState();
    _initFirebase(true);
  }

  _initFirebase(bool throwError) {
    setState(() {
      futureFirebaseApp = Firebase.initializeApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder(
      future: futureFirebaseApp,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Error: firebase init error: ${snapshot.error.toString()}');
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Text('Something went wrong!'),
                  FlatButton(
                      onPressed: () => _initFirebase(false),
                      child: Text('Retry'))
                ],
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Polla'),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }
}
