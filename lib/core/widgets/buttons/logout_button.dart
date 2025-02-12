import 'package:ceticy/core/widgets/buttons/secondary_button.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      label: 'Se déconnecter',
      onPressed: () {
        AuthProvider authProvider =
            Provider.of<AuthProvider>(context, listen: false);
        authProvider.logout();
        Navigator.pushReplacementNamed(context, '/login');
      },
    );
  }
}
