import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:ceticy/views/user/widgets/profil/settings/settings_list_radio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ceticy/providers/language_provider.dart';
import 'package:ceticy/generated/app_localizations.dart';

class SettingsPageLanguage extends StatelessWidget {
  const SettingsPageLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: AppLocalizations.of(context)!.language),
      ),
      body: ListView.builder(
        itemCount: languageProvider.languages.length,
        itemBuilder: (context, index) {
          final language = languageProvider.languages[index];
          final isSelected =
              languageProvider.currentLocale.languageCode == language['code'];

          return SettingsListRadio(
            title: language['name'],
            isSelected: isSelected,
            onChanged: (value) {
              languageProvider.setLanguage(language['code']);
            },
          );
        },
      ),
    );
  }
}
