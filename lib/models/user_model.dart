class User {
  final int id;
  final String email;
  final String password;
  final String name;
  final String? photoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.name,
      this.photoUrl,
      required this.createdAt,
      required this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
