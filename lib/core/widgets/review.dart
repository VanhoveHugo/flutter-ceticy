import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '"Ambiance chaleureuse, plats délicieux, je recommande !"',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                "John Doe",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.verified,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "12/12/2020",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              Text(
                "3",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.star,
                size: 16,
                color: Colors.amber,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
