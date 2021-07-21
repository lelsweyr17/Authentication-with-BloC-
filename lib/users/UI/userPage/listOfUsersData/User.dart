import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUser() async {
  List<User> users = [];
  final responce =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
  var jsonData = jsonDecode(responce.body);
  for (var i in jsonData) {
    User user = User(name: i['name'], email: i['email'], company: i['company']);
    users.add(user);
  }
  if (responce.status == 200) {
    return users;
  } else {
    throw Exception('Failed to load data');
  }
}

class User {
  final name;
  final email;
  final company;

  User({required this.name, required this.email, required this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      company: json['company'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'company': company,
    };
  }
}
