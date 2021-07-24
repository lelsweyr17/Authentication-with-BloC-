import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/userSession/loadingData.dart';
import 'package:test_login/userSession/userNavigator/Cubit/userDataCubit.dart';
import 'package:test_login/userSession/userNavigator/Cubit/userDataState.dart';
import 'package:test_login/userSession/userScreen/UserScreen.dart';
import 'package:test_login/userSession/userScreen/loadingDataError/LoadingErrorPage.dart';

class UserNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is LoadingDataState) MaterialPage(child: LoadingView()),
          if (state is LoadingDataErrorState)
            MaterialPage(child: LoadingErrorPage()),
          if (state is LoadedDataState) MaterialPage(child: UserScreen()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
