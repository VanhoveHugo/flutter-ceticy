import 'package:ceticy/views/user/widgets/profil/settings/settings_list_checkbox.dart';
import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/preferences_provider.dart';
import '../../../models/service.dart';
import 'package:ceticy/generated/app_localizations.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final preferencesProvider = Provider.of<PreferencesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.service),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              preferencesProvider.clearServices();
            },
            tooltip: localizations.clearAll,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: preferencesProvider.services.length,
        itemBuilder: (context, index) {
          final service = preferencesProvider.services[index];
          return _ServiceItem(
            service: service,
            onToggle: () {
              preferencesProvider.toggleService(service.id);
            },
          );
        },
      ),
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final ServicePreference service;
  final VoidCallback onToggle;

  const _ServiceItem({
    required this.service,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsListCheckbox(
      title: service.name,
      value: service.isSelected,
      onChanged: (value) {
        onToggle();
      },
    );
  }
} 