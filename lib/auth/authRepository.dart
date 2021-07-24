class AuthRepository {
  Future<void> login() async {
    print('attemptiong login');
    await Future.delayed(Duration(seconds: 3));
    print('logged in');
    throw Exception('Failed to login');
  }

  Future<String> attemptAutoLogin() async {
    await Future.delayed(Duration(seconds: 1));
    throw Exception('Not signed in');
  }

  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
