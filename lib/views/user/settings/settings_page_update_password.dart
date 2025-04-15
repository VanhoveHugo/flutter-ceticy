import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/generated/app_localizations.dart';
import 'package:ceticy/views/user/widgets/info_dev.dart';
import 'package:flutter/material.dart';

class SettingsPageUpdatePassword extends StatefulWidget {
  const SettingsPageUpdatePassword({super.key});

  @override
  SettingsPageUpdatePasswordState createState() => SettingsPageUpdatePasswordState();
}

class SettingsPageUpdatePasswordState extends State<SettingsPageUpdatePassword> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: localizations.updatePassword),
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
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: localizations.oldPassword,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: localizations.newPassword,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: localizations.confirmNewPassword,
                        ),
                      ),
                      const SizedBox(height: 32),
                      PrimaryButton(
                        onPressed: () {},
                        label: localizations.save,
                      ),
                    ],
                  )),
            ],
          ),
        )));
  }
}
