import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/authSession/authRepository.dart';
import 'package:test_login/authSession/formSubmissionStatus.dart';
import 'package:test_login/authSession/loginBloC/loginEvent.dart';
import 'package:test_login/authSession/loginBloC/loginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // Email updated
    if (event is LoginEmailChanged) {
      yield state.copyWith(email: event.email);
    }
    // Password updated
    else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    }
    // Form updated
    else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(
            formStatus: SubmissionFailed(Exception('Submission Failed')));
      }
    }
  }
}
