import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/appNavigator/Cubit/sessionCubit.dart';
import 'package:test_login/appNavigator/appNavigator.dart';
import 'package:test_login/authSession/authRepository.dart';
import 'package:test_login/userSession/userData/userRepository.dart';

class MyMultiRepositoryProvider {
  Widget multiRepositoryProvider() {
    return MultiRepositoryProvider(
      providers: _providers(),
      child: _blocProviderAppNavigator(),
    );
  }

  List<RepositoryProvider> _providers() {
    List<RepositoryProvider> providers = [
      RepositoryProvider<AuthRepository>(create: (context) => AuthRepository()),
      RepositoryProvider<UserRepository>(create: (context) => UserRepository()),
    ];
    return providers;
  }

  Widget _blocProviderAppNavigator() {
    return BlocProvider(
        create: (context) =>
            SessionCubit(authRepo: context.read<AuthRepository>()),
        child: AppNavigator());
  }
}