class Restaurant {
  final int id;
  final String name;
  final String description;
  final int? averagePrice;
  final int? averageService;
  final String? phoneNumber;
  final String? address;

  final List<String>? photos;

  Restaurant(
    this.id,
    this.name,
    this.description,
    this.averagePrice,
    this.averageService,
    this.phoneNumber,
    this.address,
    this.photos,
  );

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      json['id'],
      json['name'],
      json['description'],
      json['averagePrice'],
      json['averageService'],
      json['phoneNumber'],
      json['address'] ,
      json['photos'] != null
          ? (json['photos'] as List)
              .map((photo) => photo['url'] as String)
              .toList()
          : null,
    );
  }
}
