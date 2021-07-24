class UserRepository {
  Future<String> attemptLoadingData() async {
    await Future.delayed(Duration(seconds: 1));
    throw Exception('Data is not loaded');
  }
}
