import 'package:ceticy/views/user/widgets/profil/settings/settings_list_checkbox.dart';
import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/preferences_provider.dart';
import '../../../models/theme.dart';
import 'package:ceticy/generated/app_localizations.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final preferencesProvider = Provider.of<PreferencesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.theme),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              preferencesProvider.clearThemes();
            },
            tooltip: localizations.clearAll,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: preferencesProvider.themes.length,
        itemBuilder: (context, index) {
          final theme = preferencesProvider.themes[index];
          return _ThemeItem(
            theme: theme,
            onToggle: () {
              preferencesProvider.toggleTheme(theme.id);
            },
          );
        },
      ),
    );
  }
}

class _ThemeItem extends StatelessWidget {
  final ThemePreference theme;
  final VoidCallback onToggle;

  const _ThemeItem({
    required this.theme,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsListCheckbox(
      title: theme.name,
      value: theme.isSelected,
      onChanged: (value) {
        onToggle();
      },
    );
  }
} 