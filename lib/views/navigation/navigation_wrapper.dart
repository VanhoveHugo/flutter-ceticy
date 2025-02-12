import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ceticy/views/navigation/user_navigation.dart';
import 'package:ceticy/views/navigation/manager_navigation.dart';
import 'package:ceticy/providers/auth_provider.dart';

class NavigationWrapper extends StatelessWidget {
  const NavigationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    if (auth.isManager) {
      return const ManagerNavigation();
    } else {
      return const UserNavigation();
    }
  }
}
