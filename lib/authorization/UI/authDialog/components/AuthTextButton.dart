import 'package:flutter/material.dart';
import 'package:test_app_surf/authorization/BloC/Validation.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(Validate this.bloc, {Key? key}) : super(key: key);

  final bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: bloc.valideUser,
        builder: (context, snapshot) {
          return SizedBox(
            width: double.infinity,
            height: 40.0,
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    // TODO: Changing button color via enter email and password (uncorrect)
                    color: !snapshot.hasData
                        ? Color.fromRGBO(155, 81, 224, 0.5)
                        : Color.fromRGBO(155, 81, 224, 1),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: TextButton(
                    onPressed: !snapshot.hasData ? null : bloc.submitUser,
                    child: Text('Войти',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontFamily: 'SF Pro Display')))),
          );
        });
  }
}
