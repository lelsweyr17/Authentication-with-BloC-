import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_login/auth/formSubmissionStatus.dart';
import 'package:test_login/auth/login/loginBloc.dart';
import 'package:test_login/auth/login/loginEvent.dart';
import 'package:test_login/auth/login/loginState.dart';
import 'TextFieldStyle.dart';

class AuthorizationDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // TODO: color of elevation in RGBO(2, 28, 96, 0.2)
      insetPadding: EdgeInsets.symmetric(horizontal: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: _loginForm(context),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _loginForm(context) {
    // final bloc = Provider.of<LoginBloc>(context);
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          return _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            alignment: Alignment.center,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _emailField(),
                  _passwordField(),
                  _loginButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        validator: (value) => state.isValidEmail ? null : 'Неверный Email',
        style: TextStyle(fontSize: 16.0),
        cursorWidth: 1.0,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Theme.of(context).accentColor,
        decoration: TextFieldStyle(label: 'Email').build(),
        onChanged: (value) =>
            context.read<LoginBloc>().add(LoginEmailChanged(email: value)),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        validator: (value) => state.isValidPassword
            ? null
            : 'Слишком короткий или содержит спец символы',
        style: TextStyle(fontSize: 16.0),
        cursorWidth: 1.0,
        cursorColor: Theme.of(context).accentColor,
        obscureText: true,
        decoration: TextFieldStyle(label: 'Пароль').build(),
        onChanged: (value) => context
            .read<LoginBloc>()
            .add(LoginPasswordChanged(password: value)),
      );
    });
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return SizedBox(
            width: double.infinity,
            height: 40.0,
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    color: (state.isSubmitted)
                        ? Color.fromRGBO(155, 81, 224, 1)
                        : Color.fromRGBO(155, 81, 224, 0.5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginBloc>().add(LoginSubmitted());
                      }
                    },
                    child: Text('Войти',
                        style:
                            TextStyle(fontSize: 16.0, color: Colors.white)))));
      },
    );
  }
}
