import 'preference.dart';

class CuisineType extends Preference {
  CuisineType({
    required super.id,
    required super.name,
    super.isSelected = false,
  });

  @override
  CuisineType copyWith({
    String? id,
    String? name,
    bool? isSelected,
  }) {
    return CuisineType(
      id: id ?? this.id,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isSelected': isSelected,
    };
  }

  factory CuisineType.fromJson(Map<String, dynamic> json) {
    return CuisineType(
      id: json['id'] as String,
      name: json['name'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );
  }
} 