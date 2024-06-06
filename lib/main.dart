import 'package:flutter/material.dart';
import 'package:ceticy/core/theme.dart';
import 'package:ceticy/src/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ceticy',
      theme: AppTheme.theme,
      home: const MyHomePage(title: 'Ceticy'),
      debugShowCheckedModeBanner: false,
    );
  }
}