import 'package:flutter/material.dart';
import 'components/ErrorTextMessage.dart';
import 'components/ReloadTextBotton.dart';
import 'components/WarningSing.dart';

class LoadingErrorPage extends StatelessWidget {
  const LoadingErrorPage({Key? key}) : super(key: key);

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
