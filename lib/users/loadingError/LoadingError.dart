import 'package:flutter/material.dart';
import 'package:test_app_surf/users/loadingError/components/ErrorTextMessage.dart';
import 'package:test_app_surf/users/loadingError/components/ReloadTextBotton.dart';
import 'package:test_app_surf/users/loadingError/components/WarningSing.dart';

class LoadingError extends StatelessWidget {
  const LoadingError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          ReloadTextButton(),
        ],
      )),
    );
  }
}
