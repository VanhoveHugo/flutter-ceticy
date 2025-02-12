import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ceticy/providers/theme_provider.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentMode = themeProvider.themeMode;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: currentMode == AppThemeMode.light
                ? Colors.black
                : Colors.white
        , width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => themeProvider.updateTheme(AppThemeMode.light),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: currentMode == AppThemeMode.light
                      ? Colors.black
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Clair",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: GestureDetector(
              onTap: () => themeProvider.updateTheme(AppThemeMode.dark),
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: currentMode == AppThemeMode.light
                      ? Colors.transparent
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Sombre",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
