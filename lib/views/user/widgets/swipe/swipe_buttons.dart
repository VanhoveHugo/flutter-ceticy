import 'package:ceticy/core/app_asset.dart';
import 'package:ceticy/providers/swipe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SwipeButtons extends StatelessWidget {
  final int restaurantId;

  const SwipeButtons({super.key, required this.restaurantId});

  static const double _buttonPadding = 16.0;
  static const double _iconSize = 30.0;
  static const double _borderRadius = 16.0;
  static const double _containerBorderRadius = 24.0;
  static const double _bottomPosition = 24.0;
  static const double _descriptionBottomPosition = 40.0;
  static const double _shadowBlurRadius = 4.0;
  static const Offset _shadowOffset = Offset(0, 2);

  @override
  Widget build(BuildContext context) {
    final swipeProvider = Provider.of<SwipeProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;

    void handleSwipeAction(String action) {
      swipeProvider.setSwipeAction(action);
      swipeProvider.onPanEnd(context, restaurantId);
    }

    final bool isDescriptionVisible = swipeProvider.isDescriptionVisible;
    final bottomPosition = isDescriptionVisible ? _descriptionBottomPosition : _bottomPosition;

    return Positioned(
      bottom: bottomPosition,
      left: bottomPosition,
      right: bottomPosition,
      child: Container(
        decoration: isDescriptionVisible
            ? BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(_containerBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.onSurface.withValues(alpha: 0.1),
                    blurRadius: _shadowBlurRadius,
                    offset: _shadowOffset,
                  ),
                ],
              )
            : null,
        child: Padding(
          padding: isDescriptionVisible
              ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
              : EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDislikeButton(context, swipeProvider, handleSwipeAction),
              _buildInfoButton(context, swipeProvider),
              _buildLikeButton(context, swipeProvider, handleSwipeAction),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDislikeButton(BuildContext context, SwipeProvider swipeProvider, Function(String) handleSwipeAction) {
    if (swipeProvider.swipeAction == "like") return const SizedBox();

    return Material(
      color: Theme.of(context).colorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: InkWell(
        splashColor: const Color.fromRGBO(255, 255, 255, 0.1),
        onTap: () => handleSwipeAction("dislike"),
        borderRadius: BorderRadius.circular(_borderRadius),
        child: Padding(
          padding: const EdgeInsets.all(_buttonPadding),
          child: Icon(
            Icons.close,
            size: _iconSize,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoButton(BuildContext context, SwipeProvider swipeProvider) {
    if (swipeProvider.swipeAction == "like" || swipeProvider.swipeAction == "dislike") {
      return const SizedBox();
    }

    final bool isDescriptionVisible = swipeProvider.isDescriptionVisible;
    final colorScheme = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: () => swipeProvider.toggleDescription(),
      child: Row(
        children: [
          if (!isDescriptionVisible) ...[
            Icon(
              Icons.info_outline,
              color: colorScheme.onSurface,
              size: 24,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            isDescriptionVisible ? "Réduire" : "Info",
            style: TextStyle(
              color: colorScheme.onSurface,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLikeButton(BuildContext context, SwipeProvider swipeProvider, Function(String) handleSwipeAction) {
    if (swipeProvider.swipeAction == "dislike") return const SizedBox();

    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: InkWell(
        splashColor: const Color.fromRGBO(255, 255, 255, 0.1),
        onTap: () => handleSwipeAction("like"),
        borderRadius: BorderRadius.circular(_borderRadius),
        child: Padding(
          padding: const EdgeInsets.all(_buttonPadding),
          child: SvgPicture.asset(
            AppAsset.getSvg("Heart"),
            width: _iconSize,
            height: _iconSize,
            colorFilter: ColorFilter.mode(
              colorScheme.onPrimary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
