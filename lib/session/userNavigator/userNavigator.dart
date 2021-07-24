import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/session/loadingErrorPage/LoadingErrorPage.dart';
import 'package:test_login/session/loadingView.dart';
import 'package:test_login/session/sessionState/SessionView.dart';
import 'package:test_login/session/userNavigator/userDataCubit.dart';
import 'package:test_login/session/userNavigator/userDataState.dart';

class UserNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is LoadingData) MaterialPage(child: LoadingView()),
          if (state is LoadingDataError)
            MaterialPage(child: LoadingErrorPage()),
          if (state is LoadedData) MaterialPage(child: SessionView()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
