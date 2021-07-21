import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

// enum EmailEvent { event_valide, event_invalid, event_empty }

class Validate {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Get
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get valideUser =>
      Rx.combineLatest2(email, password, (email, password) => true);

  // Set
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  void dispose() {
    _email.close();
    _password.close();
  }

  // Transformers
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.length == 0) {
      sink.addError('Empty field');
    } else {
      sink.add(email);
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length < 8) {
      sink.addError('Less than 8 symbols');
    } else {
      sink.add(password);
    }
  });

  submitUser() {
    print('Authorization is successfull: ${_email}, ${password}');
  }
}
