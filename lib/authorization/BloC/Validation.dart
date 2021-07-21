import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class Validate {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  // TODO: when one field is valid is true, but should be false
  Stream<bool> get valideUser =>
      Rx.combineLatest2(email, password, (email, password) => true);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    RegExp regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (email.length == 0) {
      sink.addError('Пустое поле');
    } else if (!regExp.hasMatch(email)) {
      sink.addError('Неправильный email');
    } else {
      sink.add(email);
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    RegExp regExp = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
    if (!regExp.hasMatch(password)) {
      sink.addError('Пароль должен содержать 0-9, a-z, A-Z, _-=@,.;');
    } else if (password.length < 8) {
      sink.addError('Пароль должен содержать минимум 8 знаков');
    } else {
      sink.add(password);
    }
  });

  void submitUser() {
    print('Authorization is successfull: ${_email}, ${password}');
  }

  void dispose() {
    _email.close();
    _password.close();
  }
}
