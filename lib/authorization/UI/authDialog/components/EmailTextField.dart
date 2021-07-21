import 'package:flutter/material.dart';
import 'package:test_app_surf/authorization/BloC/Validation.dart';
import 'package:test_app_surf/authorization/UI/authDialog/components/TextFieldStyle.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField(Validate this.bloc, {Key? key}) : super(key: key);

  final bloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            style: TextStyle(fontSize: 16.0),
            cursorWidth: 1.0,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Theme.of(context).accentColor,
            decoration:
                TextFieldStyle(label: 'Email', error: snapshot.error).build(),
            onChanged: bloc.changeEmail,
          );
        });
  }
}
