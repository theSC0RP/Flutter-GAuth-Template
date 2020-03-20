import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gauth/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _myAuthService = AuthService();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        
        actions: <Widget> [
          FlatButton.icon(
            onPressed: () async {
              dynamic result = await _myAuthService.signOut();
              if(result == null) {
                setState(() {
                  error = 'Error: Could not log out.';
                });

                Fluttertoast.showToast(msg: error, toastLength: Toast.LENGTH_LONG);
              }
            },

            icon: Icon(Icons.exit_to_app, color: Colors.white), 
            label: Text('Log Out', style: TextStyle(color: Colors.white),)
          )
        ]
      ),

      body: Container(
        child: Center (
          child: Text('Home', style: TextStyle(fontSize: 50))
        )
      ),
    );
  }
}