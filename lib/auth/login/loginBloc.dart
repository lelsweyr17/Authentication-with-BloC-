import 'package:flutter_bloc/flutter_bloc.dart';
import '/auth/authRepository.dart';
import '/auth/formSubmissionStatus.dart';
import '/auth/login/loginEvent.dart';
import '/auth/login/loginState.dart';

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
        await authRepo.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(
            formStatus: SubmissionFailed(Exception('Submission Failure')));
      }
    }
  }
}
