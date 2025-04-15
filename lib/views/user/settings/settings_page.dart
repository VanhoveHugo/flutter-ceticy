import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:ceticy/generated/app_localizations.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:ceticy/views/user/widgets/info_dev.dart';
import 'package:ceticy/views/user/widgets/profil/settings/settings_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: localizations.settings),
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
                      Text(localizations.general,
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 16),
                      SettingsListTile(
                          name: localizations.accessibility,
                          function: () {
                            Navigator.pushNamed(
                                context, "/settings/accessibility");
                          },
                          icon: Icons.accessibility),
                      SettingsListTile(
                          name: localizations.language,
                          function: () {
                            Navigator.pushNamed(context, "/settings/language");
                          },
                          icon: Icons.language),
                      SettingsListTile(
                          name: localizations.help,
                          function: () {
                            Navigator.pushNamed(context, "/settings/help");
                          },
                          icon: Icons.help),
                      const SizedBox(height: 32),
                      Text(localizations.account,
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 16),
                      !authProvider.isManager
                          ? SettingsListTile(
                              name: localizations.addFriend,
                              function: () {
                                Navigator.pushNamed(context, "/friends/create");
                              },
                              icon: Icons.person_add)
                          : const SizedBox(),
                      SettingsListTile(
                          name: localizations.updatePassword,
                          function: () {
                            Navigator.pushNamed(
                                context, "/settings/update/password");
                          },
                          icon: Icons.lock),
                      SettingsListTile(
                          name: localizations.updateEmail,
                          function: () {
                            Navigator.pushNamed(
                                context, "/settings/update/email");
                          },
                          icon: Icons.email),
                      SettingsListTile(
                          name: localizations.deleteAccount,
                          function: () {
                            Navigator.pushNamed(
                                context, "/settings/account/delete");
                          },
                          icon: Icons.delete),
                      const SizedBox(height: 16),
                      InfoDev(),
                      const SizedBox(height: 16),
                      Text(localizations.application,
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 16),
                      SettingsListTile(
                          name: localizations.notifications,
                          function: () {
                            Navigator.pushNamed(
                                context, "/settings/notification");
                          },
                          icon: Icons.notifications),
                      SettingsListTile(
                          name: localizations.timeSpent,
                          function: () {},
                          icon: Icons.timer),
                      SettingsListTile(
                          name: localizations.privacy,
                          function: () {},
                          icon: Icons.privacy_tip),
                      SettingsListTile(
                          name: localizations.blockedAndRestricted,
                          function: () {},
                          icon: Icons.block),
                    ],
                  )),
            ],
          ),
        )));
  }
}
