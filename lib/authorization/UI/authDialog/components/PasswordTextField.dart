import 'package:flutter/material.dart';
import 'package:test_app_surf/authorization/UI/authDialog/components/TextFieldStyle.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 16.0),
      cursorWidth: 1.0,
      cursorColor: Theme.of(context).accentColor,
      obscureText: true,
      obscuringCharacter: '\u{26AB}',
      decoration: TextFieldStyle(label: 'Пароль', hint: '').build(),
    );
  }
}
