import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(),
      keyboardType: TextInputType.emailAddress,
      
    );
  }
}