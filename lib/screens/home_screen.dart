import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:polla/screens/login_screen.dart';
import 'package:polla/screens/splash_error_screen.dart';
import 'package:polla/screens/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<FirebaseApp> futureFirebaseApp;

  @override
  void initState() {
    super.initState();
    _initFirebase();
  }

  _initFirebase() {
    WidgetsFlutterBinding.ensureInitialized();
    setState(() {
      futureFirebaseApp = Firebase.initializeApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFirebaseApp,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Error: firebase init error: ${snapshot.error.toString()}');
          return SplashErrorScreen(onRetryPressed: () => _initFirebase());
        } else if (snapshot.hasData) {
          return LoginScreen();
        } else {
          return SplashScreen();
        }
      },
    );
  }
}
