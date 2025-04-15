import 'package:ceticy/views/user/widgets/profil/settings/settings_list_checkbox.dart';
import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/preferences_provider.dart';
import '../../../models/cuisine_type.dart';
import 'package:ceticy/generated/app_localizations.dart';

class CuisineTypesPage extends StatelessWidget {
  const CuisineTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final preferencesProvider = Provider.of<PreferencesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.cuisineTypes),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              preferencesProvider.clearCuisineTypes();
            },
            tooltip: localizations.clearAll,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: preferencesProvider.cuisineTypes.length,
        itemBuilder: (context, index) {
          final cuisineType = preferencesProvider.cuisineTypes[index];
          return _CuisineTypeItem(
            cuisineType: cuisineType,
            onToggle: () {
              preferencesProvider.toggleCuisineType(cuisineType.id);
            },
          );
        },
      ),
    );
  }
}

class _CuisineTypeItem extends StatelessWidget {
  final CuisineType cuisineType;
  final VoidCallback onToggle;

  const _CuisineTypeItem({
    required this.cuisineType,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsListCheckbox(
      title: cuisineType.name,
      value: cuisineType.isSelected,
      onChanged: (value) {
        onToggle();
      },
    );
  }
}
