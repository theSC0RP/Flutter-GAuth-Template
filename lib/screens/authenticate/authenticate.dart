import 'package:flutter/material.dart';
import 'package:gauth/screens/authenticate/login.dart';
import 'package:gauth/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  @override
  Widget build(BuildContext context) {
    if (showSignIn)
      return Login(toggleView: toggleView);
    else return Register(toggleView: toggleView);
  }

  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }
}