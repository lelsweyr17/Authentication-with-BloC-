import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/authSession/loginView/AuthPage.dart';
import 'package:test_login/appNavigator/sessionState.dart';
import 'package:test_login/appNavigator/sessionCubit.dart';
import 'package:test_login/userSession/userNavigator/userDataCubit.dart';
import 'package:test_login/userSession/userNavigator/userNavigator.dart';
import 'package:test_login/userSession/userRepository.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is Unauthenticated)
            MaterialPage(child: AuthorizationPage()),
          if (state is Authenticated)
            MaterialPage(
                child: BlocProvider(
              create: (context) =>
                  UserDataCubit(userRepo: context.read<UserRepository>()),
              child: UserNavigator(),
            )),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
