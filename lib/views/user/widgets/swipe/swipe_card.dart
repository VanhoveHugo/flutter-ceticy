import 'package:ceticy/core/utils/helpers.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/swipe_provider.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_indicator.dart';
import 'package:ceticy/views/user/widgets/swipe/swipe_overlay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwipeCard extends StatelessWidget {
  final Restaurant restaurant;
  final double scale;

  const SwipeCard({
    super.key,
    required this.restaurant,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    var swipeProvider = Provider.of<SwipeProvider>(context);

    return Container(
      margin: swipeProvider.isDescriptionVisible == true
          ? const EdgeInsets.all(0)
          : const EdgeInsets.only(bottom: 100),
      child: Transform.scale(
          scale: scale,
          child: GestureDetector(
            onPanUpdate: (details) {
              swipeProvider.onPanUpdate(details.delta);
            },
            onPanEnd: (details) {
              swipeProvider.onPanEnd(context, restaurant.id);
            },
            onTapUp: (details) {
              swipeProvider.onTap(context, details.globalPosition);
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  transform: restaurant.id == swipeProvider.realIndex
                      ? (Matrix4.translationValues(
                          swipeProvider.position.dx,
                          swipeProvider.position.dy,
                          0,
                        )..rotateZ(swipeProvider.rotation))
                      : Matrix4.identity(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    image: DecorationImage(
                      image: getThumbnailProvider(restaurant),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 1)
                    ],
                  ),
                  child: Stack(
                    children: [
                      SwipeOverlay(restaurant: restaurant),
                      if (scale == 1.0) SwipeIndicator(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
