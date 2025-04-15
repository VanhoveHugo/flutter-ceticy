import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/generated/app_localizations.dart';
import 'package:ceticy/views/user/widgets/info_dev.dart';
import 'package:flutter/material.dart';

class SettingsPageUpdateEmail extends StatefulWidget {
  const SettingsPageUpdateEmail({super.key});

  @override
  SettingsPageUpdateEmailState createState() => SettingsPageUpdateEmailState();
}

class SettingsPageUpdateEmailState extends State<SettingsPageUpdateEmail> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: localizations.updateEmail),
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
                          labelText: localizations.oldEmail,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: localizations.newEmail,
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
