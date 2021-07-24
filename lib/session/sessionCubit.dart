import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/auth/authRepository.dart';
import 'package:test_login/session/sessionState.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;

  SessionCubit({required this.authRepo}) : super(UnknownSessionState()) {
    attemptAutoLogin();
  }

  void attemptAutoLogin() async {
    try {
      await authRepo.attemptAutoLogin();
      emit(Authenticated());
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void showAuth() => emit(Unauthenticated());
  void showSession() {
    emit(Authenticated());
  }

  void signOut() {
    authRepo.signOut();
    emit(Unauthenticated());
  }
}
