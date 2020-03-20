import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gauth/services/auth.dart';
import 'package:email_validator/email_validator.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _myAuthService = AuthService();

  String email = '', pass = '', pass2 = '', error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: widget.toggleView,
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text("Sign In", style: TextStyle(color: Colors.white),)
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
                  validator: (val) => !(EmailValidator.validate(val)) ? 'Enter a valid email' : null,

                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  
                ),

                SizedBox(height: 10),

                TextFormField(
                  validator: (val) => val.length < 6 ? 'Enter a password having 6+ chars': null,

                  onChanged: (val) {
                    setState(() {
                      pass = val;
                    });
                  },

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),

                SizedBox(height: 10),

                TextFormField(
                  validator: (val) => val != pass ? 'Passwords do not match': null,

                  onChanged: (val) {
                    setState(() {
                      pass2 = val;
                    });
                  },

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Re-enter Password',
                  ),
                  obscureText: true,
                ),

                SizedBox(height: 20),

                RaisedButton(
                  onPressed: () async {
                    print(!(EmailValidator.validate(email)));
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _myAuthService.registerWithEmailandPass(email, pass);
                      if(result == null) {
                        setState(() {
                          error = 'Error: Could not register...';
                        });
                        Fluttertoast.showToast(msg: error, toastLength: Toast.LENGTH_LONG);
                      }
                    }
                  },
                  
                  child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                  color: Colors.lightBlue,
                )
              ]
            )
          ),
        )
      ),
    );
  }
}