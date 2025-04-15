import 'package:ceticy/core/utils/helpers.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/swipe_provider.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_description/swipe_description_smart_infos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwipeOverlay extends StatelessWidget {
  final Restaurant restaurant;

  const SwipeOverlay({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    var swipeProvider = Provider.of<SwipeProvider>(context);

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withValues(alpha: 0.8)),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    backgroundImage: getThumbnailProvider(restaurant),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      restaurant.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow
                          .ellipsis, // Ajouter les points de suspension
                      maxLines: 1, // Limite à une ligne
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: [
                      Text(
                        "3,5",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.star,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24)
                    ],
                  )
                ],
              )),
        ),
        if (swipeProvider.isDescriptionVisible == false)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SwipeDescriptionSmartInfos(restaurant: restaurant),
          )
      ],
    );
  }
}
