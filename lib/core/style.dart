import 'package:flutter/material.dart';
import 'package:ceticy/core/theme.dart';

/*
 * Colors
 */
class ThemeColor {
  ThemeColor._();
  static const Color primary = AppColor.primary400;
}

/*
 * Content
 */

const appTextPrimaryColor = TextStyle(
  color: ThemeColor.primary,
  fontWeight: FontWeight.bold,
  fontSize: 30,
);
const appTextPrimary = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 30,
);

/*
 * Widgets
 */

// TextField
const appTextFieldStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

//
const appInputDecorationStye = InputDecoration(
  labelStyle: TextStyle(
    color: Colors.white,
  ),
  hintStyle: TextStyle(
    color: AppColor.grey400,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.grey400,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.grey200,
    ),
  ),
  // errorBorder: OutlineInputBorder(
  //   borderSide: BorderSide(
  //     color: Colors.red,
  //   ),
  // ),
  // focusedErrorBorder: OutlineInputBorder(
  //   borderSide: BorderSide(
  //     color: AppColor.grey200,
  //   ),
  // ),
  // errorStyle: TextStyle(
  //   color: Colors.red,
  // ),
  // errorText: 'Erreur de saisie',
);

const appTextBrand = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 18,
);

const appText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 14,
);

var elevatedButtonPrimary = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(ThemeColor.primary),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
);

var elevatedButtonSecondary = ButtonStyle(
  side: MaterialStateProperty.resolveWith<BorderSide>(
    (Set<MaterialState> states) {
      return BorderSide(color: Colors.white, width: 1.0);
    },
  ),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
);
