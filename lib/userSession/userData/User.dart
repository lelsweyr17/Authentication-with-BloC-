import 'dart:convert';
import 'package:http/http.dart' as http;

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
