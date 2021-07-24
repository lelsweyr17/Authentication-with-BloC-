import 'package:test_login/userSession/userScreen/User/User.dart';

abstract class UserDataState {}

class LoadingDataState extends UserDataState {}

class LoadingDataErrorState extends UserDataState {}

class LoadedDataState extends UserDataState {
  List<User> loadedUser;
  LoadedDataState({required this.loadedUser});
}
