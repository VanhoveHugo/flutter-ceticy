import 'package:ceticy/providers/swipe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwipeIndicator extends StatelessWidget {
  const SwipeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    var swipeProvider = Provider.of<SwipeProvider>(context);

    if (swipeProvider.swipeAction == null) return SizedBox.shrink();

    return Positioned.fill(
      child: Stack(
        children: [
          if (swipeProvider.swipeAction == "like")
            Positioned(
              top: 48,
              left: 8,
              child: _buildIndicator("LIKE", Colors.green),
            ),
          if (swipeProvider.swipeAction == "dislike")
            Positioned(
              top: 48,
              right: 8,
              child: _buildIndicator("NOPE", Colors.red),
            ),
          if (swipeProvider.swipeAction == "superlike")
            Positioned(
              bottom: 70,
              left: 8,
              child: _buildIndicator("FAVORITE", Colors.blue),
            ),
        ],
      ),
    );
  }

  Widget _buildIndicator(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w900,
          color: color,
        ),
      ),
    );
  }
}
