import 'package:ceticy/core/widgets/image_displayer.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:ceticy/views/user/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RestaurantListPage extends StatelessWidget {
  final Category category;

  const RestaurantListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        itemCount: category.restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = category.restaurants[index];

          String estimatedTime =
              RestaurantProvider.getEstimatedTime(restaurant.averageService);
          String priceRange = restaurant.averagePrice?.toString() ?? "";
          return ListTile(
            leading: SizedBox(
              width: 70,
              height: 70,
              child: ImageDisplayer(restaurant: category.restaurants[index]),
            ),
            title: Text(restaurant.name),
            subtitle: Row(
              children: [
                estimatedTime != ""
                    ? Row(
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
                            estimatedTime,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      )
                    : Container(),
                priceRange != ""
                    ? Row(
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
                              color: i < int.parse(priceRange)
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Colors.grey,
                              size: 14,
                            ),
                        ],
                      )
                    : Container(),
              ],
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
