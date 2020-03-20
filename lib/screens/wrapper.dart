import 'package:flutter/material.dart';
import 'package:gauth/models/user.dart';
import 'package:gauth/screens/authenticate/authenticate.dart';
import 'package:gauth/screens/home/home.dart';
import 'package:provider/provider.dart';

// Display home screen if user is authenticated. Else display the auth screen.
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null)
      return Authenticate();
    else return Home();
  }
}