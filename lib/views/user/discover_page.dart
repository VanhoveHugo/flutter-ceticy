import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:ceticy/providers/swipe_provider.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_buttons.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_card.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_description.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    final List<Restaurant> restaurant =
        Provider.of<RestaurantProvider>(context).restaurants;
    var swipeProvider = Provider.of<SwipeProvider>(context);

    if (restaurant.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    int safeIndex = 0;
    swipeProvider.realIndex = restaurant[0].id;

    return SafeArea(
        child: Stack(
      fit: StackFit.expand, // Assure que tout prend l’espace disponible
      alignment: Alignment.center,
      children: [
        if (swipeProvider.isDescriptionVisible == false)
          SwipeCard(restaurant: restaurant[safeIndex]),
        if (swipeProvider.isDescriptionVisible == true)
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: swipeProvider.isDescriptionVisible == true
                        ? 66
                        : MediaQuery.of(context).size.height,
                    child: SwipeCard(
                        restaurant: restaurant[safeIndex])),
                if (swipeProvider.isDescriptionVisible)
                  SwipeDescription(
                      restaurant: restaurant[safeIndex]),
              ],
            ),
          ),
        SwipeButtons(restaurantId: restaurant[safeIndex].id),
      ],
    ));
  }
}
