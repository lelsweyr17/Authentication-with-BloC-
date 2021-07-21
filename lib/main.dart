import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_surf/authorization/BloC/Validation.dart';
import 'package:test_app_surf/authorization/UI/AuthPage.dart';
import 'package:test_app_surf/users/loadingError/LoadingError.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => Validate(),
      child: MaterialApp(
        title: 'Test App Surf',
        theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: Colors.white,
          accentColor: Color.fromRGBO(155, 81, 224, 1),
          hintColor: Colors.grey,
          fontFamily: 'SF Pro Display'
        ),
        home: LoadingError(),
        // home: AuthorizationPage(),
      ),
    );
  }
}
