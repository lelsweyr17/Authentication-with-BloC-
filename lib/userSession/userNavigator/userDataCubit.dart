import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/userSession/userNavigator/userDataState.dart';
import 'package:test_login/userSession/userRepository.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final UserRepository userRepo;

  UserDataCubit({required this.userRepo}) : super(LoadingData()) {
    attemptLoadingData();
  }

  void attemptLoadingData() async {
    try {
      await userRepo.attemptLoadingData();
      emit(LoadingDataError());
    } catch (e) {
      emit(LoadedData());
    }
  }

  void loadingData() => emit(LoadingData());

  void loadingDataError() => emit(LoadingDataError());

  void loadedData() => emit(LoadedData());
}
