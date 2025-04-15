import 'preference.dart';

class ServicePreference extends Preference {
  ServicePreference({
    required super.id,
    required super.name,
    super.isSelected = false,
  });

  @override
  ServicePreference copyWith({
    String? id,
    String? name,
    bool? isSelected,
  }) {
    return ServicePreference(
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

  factory ServicePreference.fromJson(Map<String, dynamic> json) {
    return ServicePreference(
      id: json['id'] as String,
      name: json['name'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );
  }
} 