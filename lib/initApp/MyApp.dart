import 'package:flutter/material.dart';
import 'package:test_login/initApp/MiltiRepositoryProvider.dart';
import 'package:test_login/initApp/ThemeData.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    MyMultiRepositoryProvider multiRepo = MyMultiRepositoryProvider();
    return MaterialApp(
      title: 'Demo App',
      theme: themeData(),
      home: multiRepo.multiRepositoryProvider(),
    );
  }
}
