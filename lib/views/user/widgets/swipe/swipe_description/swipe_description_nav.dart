import 'package:ceticy/providers/swipe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwipeDescriptionNav extends StatelessWidget {
  const SwipeDescriptionNav({super.key});

  @override
  Widget build(BuildContext context) {
    var swipeProvider = Provider.of<SwipeProvider>(context);
    var menuItems = swipeProvider.getMenuItems(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(menuItems.length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              swipeProvider.setSelectedMenuItem(index);
            },
            child: Column(
              children: [
                Text(
                  menuItems[index],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 16,
                    fontWeight: swipeProvider.selectedMenuItem == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 4),
                SizedBox(
                  height: 2,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 2,
                    width: double.infinity,
                    color: swipeProvider.selectedMenuItem == index
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surface,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
