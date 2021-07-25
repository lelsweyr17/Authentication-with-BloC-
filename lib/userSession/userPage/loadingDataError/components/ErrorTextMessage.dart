import 'package:flutter/material.dart';

class ErrorTextMessage extends StatelessWidget {
  const ErrorTextMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Не удалось загрузить информацию',
        style: TextStyle(fontSize: 16.0, fontFamily: 'SP Pro Display'));
  }
}
