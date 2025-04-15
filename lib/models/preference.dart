import 'package:flutter/foundation.dart';

abstract class Preference {
  final String id;
  final String name;
  bool isSelected;

  Preference({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  Preference copyWith({
    String? id,
    String? name,
    bool? isSelected,
  });

  Map<String, dynamic> toJson();
  static Preference fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('Preference.fromJson() must be implemented by subclasses');
  }
}