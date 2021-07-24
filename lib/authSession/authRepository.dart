class AuthRepository {
  Future<void> login() async {
    await Future.delayed(Duration(seconds: 3));
    throw Exception('Failed to login');
  }

  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 2));
    throw Exception('Failed to sign out');
  }
}
