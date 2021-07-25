import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/authSession/authRepository.dart';
import 'package:test_login/authSession/loginBloC/loginBloc.dart';
import 'background/HeaderText.dart';
import 'loginDialog/AuthDialog.dart';
import 'background/AuthBackgroung.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => LoginBloc(
            authRepo: context.read<AuthRepository>(),
          ),
          child: _authenticationPage(),
        ));
  }

  Widget _authenticationPage() {
    return Stack(
      children: [
        ClipPathWidget(),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderText(),
              AuthorizationDialog(),
            ])
      ],
    );
  }
}
