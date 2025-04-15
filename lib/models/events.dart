import 'preference.dart';

class EventsPreference extends Preference {
  EventsPreference({
    required super.id,
    required super.name,
    super.isSelected = false,
  });

  @override
  EventsPreference copyWith({
    String? id,
    String? name,
    bool? isSelected,
  }) {
    return EventsPreference(
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

  factory EventsPreference.fromJson(Map<String, dynamic> json) {
    return EventsPreference(
      id: json['id'] as String,
      name: json['name'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );
  }
} 