import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_login/appNavigator/appNavigator.dart';
import 'package:test_login/appNavigator/sessionCubit.dart';
import 'package:test_login/authSession/authRepository.dart';
import 'package:test_login/userSession/userRepository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        backgroundColor: Colors.white,
        fontFamily: 'SF Pro Display',
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(
              create: (context) => AuthRepository()),
          RepositoryProvider<UserRepository>(
              create: (context) => UserRepository()),
        ],
        child: BlocProvider(
          create: (context) =>
              SessionCubit(authRepo: context.read<AuthRepository>()),
          child: AppNavigator(),
        ),
      ),
    );
  }
}
