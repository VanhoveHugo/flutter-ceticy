import 'package:ceticy/views/user/widgets/profil/settings/settings_list_checkbox.dart';
import 'package:ceticy/core/widgets/app_bar/app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/preferences_provider.dart';
import '../../../models/price.dart';
import 'package:ceticy/generated/app_localizations.dart';

class PricePage extends StatelessWidget {
  const PricePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final preferencesProvider = Provider.of<PreferencesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: localizations.price),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              preferencesProvider.clearPrices();
            },
            tooltip: localizations.clearAll,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: preferencesProvider.prices.length,
        itemBuilder: (context, index) {
          final price = preferencesProvider.prices[index];
          return _PriceItem(
            price: price,
            onToggle: () {
              preferencesProvider.togglePrice(price.id);
            },
          );
        },
      ),
    );
  }
}

class _PriceItem extends StatelessWidget {
  final PricePreference price;
  final VoidCallback onToggle;

  const _PriceItem({
    required this.price,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsListCheckbox(
      title:
          '${price.name} (${price.minPrice == 0 ? '-${price.maxPrice}' : price.maxPrice == 0 ? '+${price.minPrice}' : '${price.minPrice}-${price.maxPrice}'}€)',
      value: price.isSelected,
      onChanged: (value) {
        onToggle();
      },
    );
  }
}
