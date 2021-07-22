import 'package:flutter/material.dart';
import 'package:test_app_surf/authorization/BloC/Validation.dart';
import 'package:test_app_surf/authorization/UI/authDialog/components/TextFieldStyle.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(Validate this.bloc, {Key? key}) : super(key: key);

  final bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            style: TextStyle(fontSize: 16.0),
            cursorWidth: 1.0,
            cursorColor: Theme.of(context).accentColor,
            obscureText: true,
            // obscuringCharacter: '\u{26AB}',
            decoration:
                TextFieldStyle(label: 'Пароль', error: snapshot.error).build(),
            onChanged: bloc.changePassword,
          );
        });
  }
}
