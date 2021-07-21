import 'package:flutter/material.dart';

class WarningSign extends StatelessWidget {
  const WarningSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage("images/warning-sign.jpg"),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
