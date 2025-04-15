import 'package:ceticy/core/app_asset.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:flutter/material.dart';

Widget getThumbnail(Restaurant restaurant) {
  String? imageUrl =
      (restaurant.photos != null && restaurant.photos!.isNotEmpty)
          ? restaurant.photos!.first
          : null;

  if (imageUrl == null || imageUrl.isEmpty) {
    return Image.asset(
      AppAsset.placeholder,
      fit: BoxFit.cover,
    );
  }

  return ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: FadeInImage.assetNetwork(
      placeholder: AppAsset.placeholder,
      image: imageUrl,
      fit: BoxFit.cover,
      placeholderFit: BoxFit.cover,
      imageErrorBuilder: (context, error, stackTrace) => Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: const Icon(Icons.error, color: Colors.red, size: 40),
      ),
    ),
  );
}

ImageProvider getThumbnailProvider(Restaurant restaurant) {
  String? imageUrl =
      (restaurant.photos != null && restaurant.photos!.isNotEmpty)
          ? restaurant.photos!.first
          : null;

  if (imageUrl == null || imageUrl.isEmpty) {
    return AssetImage(AppAsset.placeholder);
  }

  return NetworkImage(imageUrl);
}
