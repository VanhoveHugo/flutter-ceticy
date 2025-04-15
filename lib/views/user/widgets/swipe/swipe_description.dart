import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/swipe_provider.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_description/swipe_description_about.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_description/swipe_description_galery.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_description/swipe_description_menu.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_description/swipe_description_nav.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_description/swipe_description_reviews.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwipeDescription extends StatelessWidget {
  final Restaurant restaurant;

  const SwipeDescription({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    var swipeProvider = Provider.of<SwipeProvider>(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 32, 8, 24),
      child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwipeDescriptionNav(),
              const SizedBox(height: 16),
              if (swipeProvider.selectedMenuItem == 0)
                SwipeDescriptionAbout(restaurant: restaurant)
              else if (swipeProvider.selectedMenuItem == 1)
                SwipeDescriptionMenu()
              else if (swipeProvider.selectedMenuItem == 2)
                SwipeDescriptionGalery()
              else if (swipeProvider.selectedMenuItem == 3)
                SwipeDescriptionReviews(),
              const SizedBox(height: 100),
            ],
          )),
    );
  }
}
