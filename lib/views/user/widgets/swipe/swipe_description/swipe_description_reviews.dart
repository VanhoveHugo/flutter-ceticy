import 'package:ceticy/core/widgets/review.dart';
import 'package:ceticy/views/user/widgets/info_dev.dart';
import 'package:flutter/material.dart';

class SwipeDescriptionReviews extends StatelessWidget {
  const SwipeDescriptionReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoDev(),
        // Display number of reviews
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Text(
                  "5 Avis",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Spacer(),
                // Trier par
                Text(
                  "Trier par",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(width: 8),
                // Icone dropdown
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ],
            )),
        Review(),
        Review(),
        Review(),
        Review(),
        Review(),
      ],
    );
  }
}
