import 'package:ceticy/core/app_asset.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:flutter/material.dart';

class ImageDisplayer extends StatelessWidget {
  final Restaurant restaurant;

  const ImageDisplayer({
    Key? key,
    required this.restaurant,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String imageUrl =
        (restaurant.photos != null && restaurant.photos!.isNotEmpty)
            ? restaurant.photos!.first
            : "";

    if(imageUrl.isEmpty) {
      return Image.asset(
        AppAsset.placeholder,
        fit: BoxFit.cover,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: FadeInImage.assetNetwork(
        placeholder: AppAsset.placeholder,
        image: (restaurant.photos != null && restaurant.photos!.isNotEmpty)
            ? restaurant.photos![0]
            : "",
        fit: BoxFit.cover,
        placeholderFit: BoxFit.cover,
        imageErrorBuilder: (context, error, stackTrace) => Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: const Icon(Icons.error, color: Colors.red, size: 40),
        ),
      ),
    );
  }
}
