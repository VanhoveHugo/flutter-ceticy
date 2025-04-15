import 'preference.dart';

class OptionsPreference extends Preference {
  OptionsPreference({
    required super.id,
    required super.name,
    super.isSelected = false,
  });

  @override
  OptionsPreference copyWith({
    String? id,
    String? name,
    bool? isSelected,
  }) {
    return OptionsPreference(
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

  factory OptionsPreference.fromJson(Map<String, dynamic> json) {
    return OptionsPreference(
      id: json['id'] as String,
      name: json['name'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );
  }
} 