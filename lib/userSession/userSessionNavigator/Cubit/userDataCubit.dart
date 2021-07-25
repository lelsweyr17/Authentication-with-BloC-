import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/userSession/userData/User.dart';
import 'package:test_login/userSession/userSessionNavigator/Cubit/userDataState.dart';
import 'package:test_login/userSession/userData/userRepository.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final UserRepository userRepo;

  UserDataCubit({required this.userRepo}) : super(LoadingDataState()) {
    attemptLoadingData();
  }

  void attemptLoadingData() async {
    try {
      emit(LoadingDataState());
      final List<User> _loadedUserList = await userRepo.fetchUser();
      emit(LoadedDataState(loadedUser: _loadedUserList));
    } catch (e) {
      emit(LoadingDataErrorState());
    }
  }
}
