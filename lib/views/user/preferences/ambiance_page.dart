import 'package:ceticy/views/user/widgets/profil/settings/settings_list_checkbox.dart';
import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/preferences_provider.dart';
import '../../../models/ambiance.dart';
import 'package:ceticy/generated/app_localizations.dart';

class AmbiancePage extends StatelessWidget {
  const AmbiancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final preferencesProvider = Provider.of<PreferencesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.ambiance),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              preferencesProvider.clearAmbiances();
            },
            tooltip: localizations.clearAll,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: preferencesProvider.ambiances.length,
        itemBuilder: (context, index) {
          final ambiance = preferencesProvider.ambiances[index];
          return _AmbianceItem(
            ambiance: ambiance,
            onToggle: () {
              preferencesProvider.toggleAmbiance(ambiance.id);
            },
          );
        },
      ),
    );
  }
}

class _AmbianceItem extends StatelessWidget {
  final Ambiance ambiance;
  final VoidCallback onToggle;

  const _AmbianceItem({
    required this.ambiance,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsListCheckbox(
      title: ambiance.name,
      value: ambiance.isSelected,
      onChanged: (value) {
        onToggle();
      },
    );
  }
}
