import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:ceticy/generated/app_localizations.dart';
import 'package:ceticy/providers/theme_provider.dart';
import 'package:ceticy/views/user/widgets/info_dev.dart';
import 'package:ceticy/views/user/widgets/profil/settings/settings_list_toggle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPageAccessibility extends StatefulWidget {
  const SettingsPageAccessibility({super.key});

  @override
  SettingsAccessibilityState createState() => SettingsAccessibilityState();
}

class SettingsAccessibilityState extends State<SettingsPageAccessibility> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: localizations.accessibility),
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
                      SettingsListToggle(
                          title: localizations.highContrast,
                          subtitle: localizations.highContrastDescription,
                          isEnabled:
                              Theme.of(context).brightness == Brightness.light,
                          onChanged: (value) {
                            themeProvider.updateTheme(
                                value ? AppThemeMode.light : AppThemeMode.dark);
                          }),
                      InfoDev(),
                      SettingsListToggle(
                          title: localizations.audioReading,
                          subtitle: localizations.audioReadingDescription,
                          isEnabled: false,
                          onChanged: (value) {}),
                      SettingsListToggle(
                          title: localizations.voiceCommands,
                          subtitle: localizations.voiceCommandsDescription,
                          isEnabled: false,
                          onChanged: (value) {}),
                      SettingsListToggle(
                          title: localizations.reduceAnimations,
                          subtitle: localizations.reduceAnimationsDescription,
                          isEnabled: false,
                          onChanged: (value) {}),
                    ],
                  )),
            ],
          ),
        )));
  }
}
