import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_login/MiltiRepositoryProvider.dart';
import 'package:test_login/ThemeData.dart';
import 'package:test_login/appNavigator/appNavigator.dart';
import 'package:test_login/appNavigator/Cubit/sessionCubit.dart';
import 'package:test_login/authSession/authRepository.dart';
import 'package:test_login/userSession/userData/userRepository.dart';

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
