import 'package:flutter/material.dart';

class TextFieldStyle {
  final label;

  TextFieldStyle({required final this.label});

  InputDecoration? build() {
    return InputDecoration(
      labelText: label,
      contentPadding: EdgeInsets.symmetric(vertical: 6.0),
      labelStyle: TextStyle(
          color: Colors.black38, fontSize: 16.0),
      errorStyle: TextStyle(color: Colors.red),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(216, 216, 216, 1)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(130, 130, 130, 1)),
      ),
    );
  }
}
