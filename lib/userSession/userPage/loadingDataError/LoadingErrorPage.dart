import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/userSession/userSessionNavigator/Cubit/userDataCubit.dart';
import 'package:test_login/userSession/userSessionNavigator/Cubit/userDataState.dart';
import 'components/ErrorTextMessage.dart';
import 'components/ReloadTextBotton.dart';
import 'components/WarningSing.dart';

class LoadingErrorPage extends StatelessWidget {
  const LoadingErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserDataCubit cubit = context.read<UserDataCubit>();
    return BlocBuilder<UserDataCubit, UserDataState>(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WarningSign(),
                SizedBox(height: 30.0),
                ErrorTextMessage(),
                SizedBox(height: 30.0),
                ReloadTextButton(cubit: cubit),
              ],
            )),
          );
        });
  }
}
