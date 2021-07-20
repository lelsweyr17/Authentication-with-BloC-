import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
      child: Text('Вход',
          style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.bold,
              fontSize: 34.0,
              color: Colors.white)),
    );
  }
}
