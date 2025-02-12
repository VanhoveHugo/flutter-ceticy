import 'package:flutter/material.dart';
import 'app_colors.dart';

class ButtonStyles {
  ButtonStyles._();

  static final ButtonStyle primary = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary600,
    foregroundColor: AppColors.white,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
    textStyle: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    elevation: 0,
  );

  static final ButtonStyle secondary = ElevatedButton.styleFrom(
    foregroundColor: AppColors.grey500,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
    textStyle: const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side:
          const BorderSide(color: AppColors.grey500, width: 2.0),
    ),
    elevation: 0,
  );
}
