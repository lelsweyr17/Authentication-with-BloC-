import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/appNavigator.dart';
import 'package:test_login/sessionCubit.dart';
import 'auth/authRepository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
      ),
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: BlocProvider(
          create: (context) => SessionCubit(),
          child: AppNavigator(),
        ),
      ),
    );
  }
}
