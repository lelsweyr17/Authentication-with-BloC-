import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_login/userSession/userData/User.dart';

class UserRepository {
  Future<List<User>> fetchUser() async {
    List<User> users = [];
    final responce =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonData = json.decode(responce.body);
    for (var i in jsonData) {
      User user = User(
          name: i['name'],
          email: i['email'],
          website: i['website'],
          companyName: i['company']['name']);
      users.add(user);
    }
    if (responce.statusCode == 200) {
      return users;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
