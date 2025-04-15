import 'package:ceticy/views/user/widgets/profil/settings/settings_list_checkbox.dart';
import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/preferences_provider.dart';
import '../../../models/events.dart';
import 'package:ceticy/generated/app_localizations.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final preferencesProvider = Provider.of<PreferencesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.events),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              preferencesProvider.clearEvents();
            },
            tooltip: localizations.clearAll,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: preferencesProvider.events.length,
        itemBuilder: (context, index) {
          final event = preferencesProvider.events[index];
          return _EventsItem(
            event: event,
            onToggle: () {
              preferencesProvider.toggleEvent(event.id);
            },
          );
        },
      ),
    );
  }
}

class _EventsItem extends StatelessWidget {
  final EventsPreference event;
  final VoidCallback onToggle;

  const _EventsItem({
    required this.event,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsListCheckbox(
      title: event.name,
      value: event.isSelected,
      onChanged: (value) {
        onToggle();
      },
    );
  }
}
