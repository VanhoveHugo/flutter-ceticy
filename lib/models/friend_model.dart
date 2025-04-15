class Friend {
  final int id;
  final String email;

  Friend({required this.id, required this.email});

  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      id: json['id'],
      email: json['email'],
    );
  }
}
