import 'preference.dart';

class ThemePreference extends Preference {
  ThemePreference({
    required super.id,
    required super.name,
    super.isSelected = false,
  });

  @override
  ThemePreference copyWith({
    String? id,
    String? name,
    String? icon,
    bool? isSelected,
  }) {
    return ThemePreference(
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

  factory ThemePreference.fromJson(Map<String, dynamic> json) {
    return ThemePreference(
      id: json['id'] as String,
      name: json['name'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );
  }
} 