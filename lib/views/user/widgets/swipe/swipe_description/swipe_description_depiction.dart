import 'package:ceticy/models/restaurant_model.dart';
import 'package:flutter/material.dart';

class SwipeDescriptionDepiction extends StatelessWidget {
  final Restaurant restaurant;

  const SwipeDescriptionDepiction({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              restaurant.description,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 13,
              ),
            ),
          ],
        ));
  }
}
