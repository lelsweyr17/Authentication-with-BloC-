import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/auth/authRepository.dart';
import 'package:test_login/session/sessionState.dart';

class SessionCubit extends Cubit<SessionState> {

  SessionCubit() : super(Unauthenticated());

  void showAuth() => emit(Unauthenticated());
  void showSession() {
    emit(Authenticated());
  }

  void signOut() {
    // authRepo.signOut();
    emit(Unauthenticated());
  }
  
}