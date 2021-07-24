class AuthRepository {
  Future<void> login() async {
    print('attemptiong login');
    Future.delayed(Duration(seconds: 3));
    print('logged in');
    throw Exception('Failed to login');
  }
}