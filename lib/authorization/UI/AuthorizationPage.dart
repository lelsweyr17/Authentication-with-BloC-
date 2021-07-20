import 'package:flutter/material.dart';
import 'package:test_app_surf/authorization/UI/background/ClipPathWidget.dart';
import 'package:test_app_surf/authorization/UI/authDialog/AuthorizationDialog.dart';
import 'package:test_app_surf/authorization/UI/HeaderText.dart';

class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPathWidget(),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText(),
                AuthorizationDialog(),
              ])
        ],
      ),
    );
  }
}
