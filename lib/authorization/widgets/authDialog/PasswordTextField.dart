import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).accentColor,
      obscureText: true,
      obscuringCharacter: '\u{26AB}',
      decoration: InputDecoration(
        labelText: 'Пароль',
        // TODO: change focus color for label to accent color
        labelStyle: TextStyle(
            color: Colors.black38,
            fontFamily: 'SF Pro Display',
            fontSize: 16.0),
        errorStyle: TextStyle(color: Colors.red),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(216, 216, 216, 1)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(130, 130, 130, 1)),
        ),
      ),
    );
  }
}
