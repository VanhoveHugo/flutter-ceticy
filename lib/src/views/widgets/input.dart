import 'package:flutter/material.dart';
import 'package:ceticy/core/style.dart';

class AppInput extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? icon;
  final String? hint;
  final bool? obscureText;

  const AppInput({
    super.key,
    this.controller,
    this.icon,
    this.hint,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText ?? false,
      style: appTextFieldStyle,
      decoration: appInputDecorationStye.copyWith(
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        hintText: hint,
      ),
    );
  }
}
