import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:ceticy/generated/app_localizations.dart';
import 'package:ceticy/views/user/widgets/info_dev.dart';
import 'package:ceticy/views/user/widgets/profil/settings/settings_list_tile.dart';
import 'package:ceticy/views/user/widgets/profil/settings/settings_list_toggle.dart';
import 'package:flutter/material.dart';

class SettingsPageNotification extends StatelessWidget {
  const SettingsPageNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.notifications),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoDev(),
                    SettingsListToggle(
                      title: localizations.disableNotifications,
                      isEnabled: true,
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 32),
                    SettingsListTile(name: localizations.friends, function: () {}),
                    SettingsListTile(name: localizations.polls, function: () {}),
                    SettingsListTile(name: localizations.interests, function: () {}),
                    SettingsListTile(name: localizations.stories, function: () {}),
                    SettingsListTile(name: localizations.reviews, function: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
