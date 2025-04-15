import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantsListPage extends StatefulWidget {
  const RestaurantsListPage({super.key});

  @override
  RestaurantsListPageState createState() => RestaurantsListPageState();
}

class RestaurantsListPageState extends State<RestaurantsListPage> {
  @override
  Widget build(BuildContext context) {
    final RestaurantProvider restaurantProvider =
        Provider.of<RestaurantProvider>(context, listen: false);
    var restaurants = restaurantProvider.restaurants;
    var currentRestaurant =
        restaurantProvider.currentRestaurantManager;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurants"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, "/restaurants/create");
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(restaurants[index].name),
            subtitle: Text("${restaurants[index].id}"),
            tileColor: currentRestaurant!.id == restaurants[index].id
                ? Theme.of(context).colorScheme.surface
                : Colors.transparent,
            onTap: () {
              restaurantProvider.setCurrentRestaurantManager(
                  restaurants[index]);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
