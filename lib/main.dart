// @dart=2.9
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

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
            body: FlatButton(
              onPressed: () async {
                print(await signInWithGoogle());
              },
              child: Text('Google Sign-in'),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }
}
