import 'package:ceticy/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SwipeDescriptionSmartInfos extends StatelessWidget {
  final Restaurant restaurant;

  const SwipeDescriptionSmartInfos({super.key, required this.restaurant});

  String getAverageService() {
    var price = restaurant.averageService;
    if (price == 1) {
      return "15 min";
    } else if (price == 2) {
      return "30 min";
    } else if (price == 3) {
      return "45 min";
    }
    return "20 min";
  }

  String getPosition() {
    return "1 km";
  }

  @override
  Widget build(BuildContext context) {
    String service = getAverageService();
    String position = getPosition();
    return Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context)
                .scaffoldBackgroundColor
                .withValues(alpha: 0.8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Time-Circle.svg',
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  service,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Card.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 5),
                for (var i = 0; i < 3; i++)
                  Icon(
                    Icons.euro,
                    color: i < 2
                        ? Theme.of(context).colorScheme.onSurface
                        : Colors.grey,
                    size: 14,
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Location.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  position,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
