import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 16.0),
      keyboardType: TextInputType.emailAddress,
      cursorColor: Theme.of(context).accentColor,
      decoration: InputDecoration(
        labelText: 'Email',
        // TODO: change focus color for label to accent color and size of font
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
