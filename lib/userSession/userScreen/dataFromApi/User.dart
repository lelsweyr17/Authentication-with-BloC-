import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUser() async {
  List<User> users = [];
  final responce =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
  var jsonData = jsonDecode(responce.body);
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

class User {
  final name;
  final email;
  final website;
  final companyName;

  User(
      {required this.name,
      required this.email,
      required this.website,
      required this.companyName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      website: json['website'],
      companyName: json['company']['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'website': website,
      'companyName': companyName,
    };
  }
}
