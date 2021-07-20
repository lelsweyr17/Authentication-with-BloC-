import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(155, 81, 224, 0.5),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: TextButton(
              onPressed: () {},
              child: Text('Войти',
                  style: TextStyle(fontSize: 16.0, color: Colors.white)))),
    );
  }
}
