class Swipe {
  final int id;
  final int userId;
  final int restaurantId;
  final bool liked;
  final DateTime timestamp;

  Swipe(this.id, this.userId, this.restaurantId, this.liked, this.timestamp);

  factory Swipe.fromJson(Map<String, dynamic> json) {
    return Swipe(
      json['id'],
      json['userId'],
      json['restaurantId'],
      json['liked'],
      DateTime.parse(json['timestamp']),
    );
  }
}
