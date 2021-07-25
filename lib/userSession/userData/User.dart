class User {
  final name;
  final email;
  final companyName;

  User({required this.name, required this.email, required this.companyName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      companyName: json['company']['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'companyName': companyName,
    };
  }
}
