import 'preference.dart';

class DistancePreference extends Preference {
  final int maxDistance; // in kilometers

  DistancePreference({
    required super.id,
    required super.name,
    required this.maxDistance,
    super.isSelected = false,
  });

  @override
  DistancePreference copyWith({
    String? id,
    String? name,
    int? maxDistance,
    bool? isSelected,
  }) {
    return DistancePreference(
      id: id ?? this.id,
      name: name ?? this.name,
      maxDistance: maxDistance ?? this.maxDistance,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'maxDistance': maxDistance,
      'isSelected': isSelected,
    };
  }

  factory DistancePreference.fromJson(Map<String, dynamic> json) {
    return DistancePreference(
      id: json['id'] as String,
      name: json['name'] as String,
      maxDistance: json['maxDistance'] as int,
      isSelected: json['isSelected'] as bool? ?? false,
    );
  }
} 