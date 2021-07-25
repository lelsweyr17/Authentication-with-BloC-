import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/userSession/userPage/loadingData.dart';
import 'package:test_login/userSession/userSessionNavigator/Cubit/userDataCubit.dart';
import 'package:test_login/userSession/userSessionNavigator/Cubit/userDataState.dart';
import 'package:test_login/userSession/userPage/UserScreen.dart';
import 'package:test_login/userSession/userPage/loadingDataError/LoadingErrorPage.dart';

class UserNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(builder: (context, state) {
      return Navigator(
        pages: _pages(state),
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }

  List<Page> _pages(state) {
    List<Page> pages = [
      if (state is LoadingDataState)
        MaterialPage(child: LoadingScreen()),
      if (state is LoadingDataErrorState)
        MaterialPage(child: LoadingErrorPage()),
      if (state is LoadedDataState)
        MaterialPage(child: UserScreen()),
    ];
    return pages;
  }
}
