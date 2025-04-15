import 'package:ceticy/views/user/widgets/profil/settings/settings_list_checkbox.dart';
import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/preferences_provider.dart';
import '../../../models/options.dart';
import 'package:ceticy/generated/app_localizations.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final preferencesProvider = Provider.of<PreferencesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.options),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              preferencesProvider.clearOptions();
            },
            tooltip: localizations.clearAll,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: preferencesProvider.options.length,
        itemBuilder: (context, index) {
          final option = preferencesProvider.options[index];
          return _OptionsItem(
            option: option,
            onToggle: () {
              preferencesProvider.toggleOption(option.id);
            },
          );
        },
      ),
    );
  }
}

class _OptionsItem extends StatelessWidget {
  final OptionsPreference option;
  final VoidCallback onToggle;

  const _OptionsItem({
    required this.option,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsListCheckbox(
      title: option.name,
      value: option.isSelected,
      onChanged: (value) {
        onToggle();
      },
    );
  }
} 