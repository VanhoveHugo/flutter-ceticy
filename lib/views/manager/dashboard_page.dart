import 'package:ceticy/core/widgets/buttons/logout_button.dart';
import 'package:ceticy/core/widgets/form/border_tile.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:ceticy/views/manager/dashboard/dashboard_head.dart';
import 'package:ceticy/views/user/widgets/profil/settings/settings_list_toggle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ceticy/generated/app_localizations.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    Restaurant restaurant =
        Provider.of<RestaurantProvider>(context).currentRestaurantManager!;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardHead(restaurant: restaurant),
              SettingsListToggle(
                  title: "Établissement visible",
                  isEnabled: true,
                  onChanged: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(AppLocalizations.of(context)!.featureNotAvailable),
                      ),
                    );
                  }),
              const SizedBox(height: 16),
              BorderTile(
                  name: "Statistiques",
                  function: () {
                    Navigator.pushNamed(context, "/comments");
                  },
                  icon: Icons.bar_chart),
              BorderTile(
                  name: "Commentaires",
                  function: () {
                    Navigator.pushNamed(context, "/comments");
                  },
                  icon: Icons.comment),
              BorderTile(
                  name: "Menu",
                  function: () {
                    Navigator.pushNamed(context, "/comments");
                  },
                  icon: Icons.restaurant),
              BorderTile(
                  name: "Intérêts",
                  function: () {
                    Navigator.pushNamed(context, "/comments");
                  },
                  icon: Icons.star),
              const SizedBox(height: 24),
                        LogoutButton(),
              const SizedBox(height: 24),

            ],
          ),
        ),
      ),
    );
  }
}
