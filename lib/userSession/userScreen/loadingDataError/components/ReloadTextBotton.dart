import 'package:flutter/material.dart';

class ReloadTextButton extends StatelessWidget {
  final cubit;
  const ReloadTextButton({required final this.cubit}) : super();

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
                onPressed: () {
                  cubit.attemptLoadingData();
                },
                child: Text('Обновить',
                    style: TextStyle(fontSize: 16.0, color: Colors.white)))),
      ),
    );
  }
}
