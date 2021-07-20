import 'package:flutter/material.dart';
import 'package:test_app_surf/authorization/widgets/ClipPathWidget.dart';
import 'package:test_app_surf/authorization/widgets/authDialog/AuthorizationDialog.dart';

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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 40.0),
                  child: Text('Вход',
                      style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.bold,
                          fontSize: 34.0,
                          color: Colors.white)),
                ),
                AuthorizationDialog(),
              ])
        ],
      ),
    );
  }
}
