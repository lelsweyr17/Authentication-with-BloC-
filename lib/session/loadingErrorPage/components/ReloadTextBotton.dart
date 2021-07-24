import 'package:flutter/material.dart';

class ReloadTextButton extends StatelessWidget {
  const ReloadTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0),
      child: SizedBox(
        width: double.infinity,
        height: 40.0,
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
                color: Color.fromRGBO(155, 81, 224, 1),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            child: TextButton(
                onPressed: () {},
                child: Text('Обновить',
                    style: TextStyle(fontSize: 16.0, color: Colors.white)))),
      ),
    );
  }
}
