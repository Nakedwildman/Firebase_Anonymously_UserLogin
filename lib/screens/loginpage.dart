import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Future<void> _createUser() async {
    UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: MaterialButton(
        onPressed: _createUser,
        child: Text('Create New Account'),
        ),
      ),
    );
  }
}
