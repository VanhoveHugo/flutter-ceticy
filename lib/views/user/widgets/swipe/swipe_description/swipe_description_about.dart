import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/views/user/widgets/info_dev.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_description/swipe_description_contact.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_description/swipe_description_depiction.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_description/swipe_description_smart_infos.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_description/swipe_description_tags.dart';
import 'package:flutter/material.dart';

class SwipeDescriptionAbout extends StatelessWidget {
  final Restaurant restaurant;

  const SwipeDescriptionAbout({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    var hasDescription = restaurant.description.isNotEmpty;
    var hasContactInfo =
        restaurant.address != null || restaurant.phoneNumber != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwipeDescriptionSmartInfos(restaurant: restaurant),
        if (hasDescription) SwipeDescriptionDepiction(restaurant: restaurant),
        if (hasContactInfo) SwipeDescriptionContact(restaurant: restaurant),
        InfoDev(),
        SwipeDescriptionTags(restaurant: restaurant),
      ],
    );
  }
}
