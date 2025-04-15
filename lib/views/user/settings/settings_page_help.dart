import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:ceticy/generated/app_localizations.dart';
import 'package:ceticy/views/user/widgets/info_dev.dart';
import 'package:ceticy/views/user/widgets/profil/settings/settings_list_tile.dart';
import 'package:flutter/material.dart';

class SettingsPageHelp extends StatelessWidget {
  const SettingsPageHelp({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.help),
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
                    SettingsListTile(
                        name: localizations.reportProblem, function: () {}),
                    SettingsListTile(
                        name: localizations.faq, function: () {}),
                    const SizedBox(height: 16),
                    SettingsListTile(
                        name: localizations.aboutApp, function: () {}),
                    SettingsListTile(
                        name: localizations.privacyPolicy, function: () {}),
                    SettingsListTile(
                        name: localizations.termsOfUse, function: () {}),
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
