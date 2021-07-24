import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/userSession/userNavigator/Cubit/userDataState.dart';
import 'package:test_login/userSession/userRepository.dart';
import 'package:test_login/userSession/userScreen/User/User.dart';

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
