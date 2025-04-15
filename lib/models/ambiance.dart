import 'preference.dart';

class Ambiance extends Preference {
  Ambiance({
    required super.id,
    required super.name,
    super.isSelected = false,
  });

  @override
  Ambiance copyWith({
    String? id,
    String? name,
    bool? isSelected,
  }) {
    return Ambiance(
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

  factory Ambiance.fromJson(Map<String, dynamic> json) {
    return Ambiance(
      id: json['id'] as String,
      name: json['name'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );
  }
} 