import 'package:flutter/material.dart';

class AppAsset {
  AppAsset._();

  static String logo(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? 'assets/images/logo-dark.png'
        : 'assets/images/logo-light.png';
  }

  static String placeholder = 'assets/images/placeholder.png';
  static String defaultBadge = 'assets/images/badge_default.png';

  static String getSvg(String name) {
    return 'assets/icons/$name.svg';
  }
}
