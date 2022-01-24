import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/screens/homepage.dart';
import 'package:firebase_project/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {  //Decides wether to go to loginpage or homepage

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }

        if(snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              Object? user;
              if(snapshot.connectionState == ConnectionState.active)
                user  = snapshot.data;

              if(user == null) {
                return LoginPage();
              } else {
                return Homepage();
              }
            }
        );
      }
        return Scaffold(
          body: Center(
            child: Text('Connecting to the app...'),
          ),
        );
      },
    );
  }
}
