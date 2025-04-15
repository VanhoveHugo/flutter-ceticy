import 'package:ceticy/views/user/widgets/profil/settings/settings_list_checkbox.dart';
import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/preferences_provider.dart';
import '../../../models/distance.dart';
import 'package:ceticy/generated/app_localizations.dart';

class DistancePage extends StatelessWidget {
  const DistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final preferencesProvider = Provider.of<PreferencesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.distance),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              preferencesProvider.clearDistances();
            },
            tooltip: localizations.clearAll,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: preferencesProvider.distances.length,
        itemBuilder: (context, index) {
          final distance = preferencesProvider.distances[index];
          return _DistanceItem(
            distance: distance,
            onToggle: () {
              preferencesProvider.toggleDistance(distance.id);
            },
          );
        },
      ),
    );
  }
}

class _DistanceItem extends StatelessWidget {
  final DistancePreference distance;
  final VoidCallback onToggle;

  const _DistanceItem({
    required this.distance,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsListCheckbox(
      title: distance.name,
      value: distance.isSelected,
      onChanged: (value) {
        onToggle();
      },
    );
  }
}
