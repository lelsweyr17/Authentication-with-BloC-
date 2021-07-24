import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/session/loadingView.dart';
import 'package:test_login/session/sessionState.dart';
import 'package:test_login/session/sessionState/SessionView.dart';
import 'package:test_login/session/sessionCubit.dart';

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
          if (state is Authenticated) MaterialPage(child: SessionView()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
