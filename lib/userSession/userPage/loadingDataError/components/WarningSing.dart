import 'package:flutter/material.dart';

class WarningSign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage("images/warning.png"),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
