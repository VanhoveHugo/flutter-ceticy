import 'package:ceticy/core/app_asset.dart';
import 'package:ceticy/core/utils/helpers.dart';
import 'package:ceticy/core/widgets/buttons/tertiary_button.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/views/manager/restaurants/restaurant_update_page.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_description/swipe_description_smart_infos.dart';
import 'package:flutter/material.dart';

class DashboardHead extends StatelessWidget {
  const DashboardHead({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: getThumbnailProvider(restaurant),
              radius: 40,
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundImage: AssetImage(AppAsset.placeholder),
              radius: 20,
            ),
            const SizedBox(width: 4),
            CircleAvatar(
              backgroundImage: AssetImage(AppAsset.placeholder),
              radius: 20,
            ),
            const SizedBox(width: 4),
            CircleAvatar(
              backgroundImage: AssetImage(AppAsset.placeholder),
              radius: 20,
            ),
            const SizedBox(width: 4),
            CircleAvatar(
              backgroundImage: AssetImage(AppAsset.placeholder),
              radius: 20,
            ),
          ],
        ),
        SwipeDescriptionSmartInfos(restaurant: restaurant),
        Text(
          restaurant.description,
        ),
        const SizedBox(height: 16),
        TerciaryButton(
          label: "Modifier le restaurant",
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => RestaurantsUpdatePage(restaurant: restaurant),
            ));
          },
        ),
      ],
    );
  }
}
