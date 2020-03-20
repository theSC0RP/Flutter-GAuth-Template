import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gauth/services/auth.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({ this.toggleView });

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _myAuthService = AuthService();
  String email = '', password = '', error = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: widget.toggleView,
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text("Sign Up", style: TextStyle(color: Colors.white),)
          )
        ],
        
        elevation: 0.0, 
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },

                  keyboardType: TextInputType.emailAddress,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                ),

                SizedBox(height: 10),

                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),

                  obscureText: true,
                ),

                SizedBox(height: 20),

                RaisedButton(
                  onPressed: () async {
                    dynamic result = await _myAuthService.signInWithEmailandPass(email, password);

                    if(result == null) {
                      setState(() {
                        error = 'Error: Could not sign you in. Enter valid information.';
                      });
                      Fluttertoast.showToast(msg: error, toastLength: Toast.LENGTH_LONG);
                    }

                  },

                  color: Colors.lightBlue,
                  child: Text('Sign In', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          )
        )
      ),
    );
  }
}