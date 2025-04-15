import 'package:ceticy/models/restaurant_model.dart';
import 'package:flutter/material.dart';

class SwipeDescriptionTags extends StatelessWidget {
  final Restaurant restaurant;

  const SwipeDescriptionTags({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    var tags = [
      "Frainçais",
      "Traditionnel",
      "Luxueux",
      "Couple",
      "Calme",
      "Tendance"
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tags
          .map(
            (tag) => Chip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified,
                    size: 14,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    tag,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 1.5),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          )
          .toList(),
    );
  }
}
