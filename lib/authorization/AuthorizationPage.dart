import 'package:flutter/material.dart';
import 'package:test_app_surf/authorization/widgets/ClipPathWidget.dart';
import 'package:test_app_surf/authorization/widgets/AuthorizationDialog.dart';

class AuthorizationPage extends StatelessWidget {
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text('Вход',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.white,
                          letterSpacing: 2.0)),
                ),
                AuthorizationDialog(),
              ])
        ],
      ),
    );
  }
}
