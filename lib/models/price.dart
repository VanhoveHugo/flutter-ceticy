import 'preference.dart';

class PricePreference extends Preference {
  final int minPrice;
  final int maxPrice;

  PricePreference({
    required super.id,
    required super.name,
    required this.minPrice,
    required this.maxPrice,
    super.isSelected = false,
  });

  @override
  PricePreference copyWith({
    String? id,
    String? name,
    int? minPrice,
    int? maxPrice,
    bool? isSelected,
  }) {
    return PricePreference(
      id: id ?? this.id,
      name: name ?? this.name,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
      'isSelected': isSelected,
    };
  }

  factory PricePreference.fromJson(Map<String, dynamic> json) {
    return PricePreference(
      id: json['id'] as String,
      name: json['name'] as String,
      minPrice: json['minPrice'] as int,
      maxPrice: json['maxPrice'] as int,
      isSelected: json['isSelected'] as bool? ?? false,
    );
  }
} 