import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:ceticy/views/manager/dashboard_page.dart';
import 'package:provider/provider.dart';

class ManagerNavigation extends StatefulWidget {
  const ManagerNavigation({super.key});

  @override
  ManagerNavigationState createState() => ManagerNavigationState();
}

class ManagerNavigationState extends State<ManagerNavigation> {
  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    Restaurant? restaurant = restaurantProvider.currentRestaurantManager;
    if (restaurant == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("/restaurants/list");
          },
          child: Row(
            children: [
              Flexible(
                child: Text(
                  restaurant.name,
                  style: const TextStyle(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.keyboard_arrow_down,
                size: 18,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed("/settings");
            },
          ),
        ],
      ),
      body: DashboardPage(),
    );
  }
}
