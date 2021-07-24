import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/session/loadingView.dart';
import 'package:test_login/session/sessionState.dart';
import 'package:test_login/session/sessionCubit.dart';
import 'package:test_login/session/userNavigator/userDataCubit.dart';
import 'package:test_login/session/userNavigator/userNavigator.dart';
import 'package:test_login/session/userNavigator/userRepository.dart';

import 'auth/login/loginView/AuthPage.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is UnknownSessionState) MaterialPage(child: LoadingView()),
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
