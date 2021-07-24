import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/appNavigator/sessionState.dart';
import 'package:test_login/authSession/authRepository.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;

  SessionCubit({required this.authRepo}) : super(Unauthenticated()) {
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