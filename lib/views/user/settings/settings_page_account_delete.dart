import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:ceticy/core/widgets/buttons/primary_button.dart';
import 'package:ceticy/generated/app_localizations.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:ceticy/views/user/widgets/profil/settings/settings_list_toggle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPageAccountDelete extends StatefulWidget {
  const SettingsPageAccountDelete({super.key});

  @override
  State<SettingsPageAccountDelete> createState() =>
      _SettingsPageAccountDeleteState();
}

class _SettingsPageAccountDeleteState extends State<SettingsPageAccountDelete> {
  bool _isConfirmed = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.deleteAccount),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  localizations.deleteAccountWarning,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
              const SizedBox(height: 4),
              Text(localizations.deleteAccountWarning1),
              Text(localizations.deleteAccountWarning2),
              Text(localizations.deleteAccountWarning3),
              const SizedBox(height: 16),
              Text(
                  localizations.deleteAccountWarning2,
                  style: TextStyle(fontWeight: FontWeight.w600)),
              SettingsListToggle(
                title: localizations.iUnderstand,
                isEnabled: _isConfirmed,
                onChanged: (value) {
                  setState(() {
                    _isConfirmed = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                  label: localizations.deleteAccount,
                  onPressed: () {
                    if (_isConfirmed) {
                      AuthProvider authProvider =
                          Provider.of<AuthProvider>(context, listen: false);
                      authProvider.accountDelete();
                      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
