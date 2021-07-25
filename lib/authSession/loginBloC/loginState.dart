import '../formSubmissionStatus.dart';

class LoginState {
  final String email;
  final String password;
  final FormSubmissionStatus formStatus;

  bool get isValidEmail => (_emailValidation(email));
  bool get isValidPassword => (_passwordValidation(password));
  bool get isSubmitted => (_isLoggedIn());

  // Email validation
  bool _emailValidation(email) {
    RegExp regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regExp.hasMatch(email)) {
      return false;
    } else {
      return true;
    }
  }
  // Password validation
  bool _passwordValidation(password) {
    RegExp regExp = RegExp(r'^[a-zA-Z0-9].{7,}$');
    if (!regExp.hasMatch(password)) {
      return false;
    } else {
      return true;
    }
  }
  // Login button validation
  bool _isLoggedIn() {
    if (_emailValidation(email) == true &&
        _passwordValidation(password) == true) {
      return true;
    } else {
      return false;
    }
  }

  LoginState(
      {this.email = '',
      this.password = '',
      this.formStatus = const InitialFormStatus()});

  LoginState copyWith(
      {String? email, String? password, FormSubmissionStatus? formStatus}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
