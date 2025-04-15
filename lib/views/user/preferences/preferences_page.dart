import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:ceticy/views/user/widgets/tile_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/preferences_provider.dart';
import 'package:ceticy/generated/app_localizations.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final preferencesProvider = Provider.of<PreferencesProvider>(context);
    final selectedCuisineCount =
        preferencesProvider.selectedCuisineTypes.length;
    final selectedAmbianceCount = preferencesProvider.selectedAmbiances.length;
    final selectedThemeCount = preferencesProvider.selectedThemes.length;
    final selectedPriceCount = preferencesProvider.selectedPrices.length;
    final selectedServiceCount = preferencesProvider.selectedServices.length;
    final selectedOptionsCount = preferencesProvider.selectedOptions.length;
    final selectedDistanceCount = preferencesProvider.selectedDistances.length;
    final selectedEventsCount = preferencesProvider.selectedEvents.length;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.preferences),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(localizations.preferencesDescription),
                const SizedBox(height: 24),
                TileCategory(
                  title: localizations.cuisineType,
                  subtitle: localizations.itemSelected(selectedCuisineCount),
                  onTap: () {
                    Navigator.pushNamed(context, '/preferences/cuisine-types');
                  },
                  icon: Icons.restaurant_menu,
                ),
                TileCategory(
                  title: localizations.ambiance,
                  subtitle: localizations.itemSelected(selectedAmbianceCount),
                  onTap: () {
                    Navigator.pushNamed(context, '/preferences/ambiances');
                  },
                  icon: Icons.mood,
                ),
                TileCategory(
                  title: localizations.theme,
                  subtitle: localizations.itemSelected(selectedThemeCount),
                  onTap: () {
                    Navigator.pushNamed(context, '/preferences/themes');
                  },
                  icon: Icons.category,
                ),
                TileCategory(
                  title: localizations.price,
                  subtitle: localizations.itemSelected(selectedPriceCount),
                  onTap: () {
                    Navigator.pushNamed(context, '/preferences/prices');
                  },
                  icon: Icons.attach_money,
                ),
                TileCategory(
                  title: localizations.service,
                  subtitle: localizations.itemSelected(selectedServiceCount),
                  onTap: () {
                    Navigator.pushNamed(context, '/preferences/services');
                  },
                  icon: Icons.room_service,
                ),
                TileCategory(
                  title: localizations.options,
                  subtitle: localizations.itemSelected(selectedOptionsCount),
                  onTap: () {
                    Navigator.pushNamed(context, '/preferences/options');
                  },
                  icon: Icons.settings,
                ),
                TileCategory(
                  title: localizations.distance,
                  subtitle: localizations.itemSelected(selectedDistanceCount),
                  onTap: () {
                    Navigator.pushNamed(context, '/preferences/distances');
                  },
                  icon: Icons.location_on,
                ),
                TileCategory(
                  title: localizations.events,
                  subtitle: localizations.itemSelected(selectedEventsCount),
                  onTap: () {
                    Navigator.pushNamed(context, '/preferences/events');
                  },
                  icon: Icons.event,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
