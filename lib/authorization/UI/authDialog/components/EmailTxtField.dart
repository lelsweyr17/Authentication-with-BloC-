import 'package:flutter/material.dart';
import 'package:test_app_surf/authorization/UI/authDialog/components/TextFieldStyle.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(fontSize: 16.0),
        cursorWidth: 1.0,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Theme.of(context).accentColor,
        decoration: TextFieldStyle(label: 'Email', hint: '').build(),
    );
  }
}
