import 'package:ceticy/core/utils/helpers.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePollRestaurants extends StatefulWidget {
  final Restaurant? controller;
  final Function(Restaurant) onFriendsUpdated;

  const CreatePollRestaurants(
      {super.key, required this.controller, required this.onFriendsUpdated});

  @override
  CreatePollRestaurantsState createState() => CreatePollRestaurantsState();
}

class CreatePollRestaurantsState extends State<CreatePollRestaurants> {
  late Restaurant? selectedRestaurant;
  late bool submitIsEmpty = false;

  @override
  void initState() {
    super.initState();
    selectedRestaurant = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    final restaurantProvider =
        Provider.of<RestaurantProvider>(context, listen: false);
    final likedRestaurants = restaurantProvider.likedRestaurants;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Choix du lieu", style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 8),
      Text(
          "Sélectionnez le lieu de votre événement parmi les restaurants et bars que vous avez aimés",
          style: Theme.of(context).textTheme.bodyMedium),
      const SizedBox(height: 40),
      Column(
        children: likedRestaurants.map((restaurant) {
          return ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: getThumbnail(restaurant),
            ),
            title: Text(restaurant.name,
                style: Theme.of(context).textTheme.bodyMedium),
            trailing: selectedRestaurant == restaurant
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank),
            tileColor: selectedRestaurant == restaurant
                ? Theme.of(context).colorScheme.surface
                : null,
            onTap: () {
              setState(() {
                selectedRestaurant = restaurant;
              });
              widget.onFriendsUpdated(restaurant);
            },
          );
        }).toList(),
      ),
      if (submitIsEmpty)
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            "Vous devez sélectionner au moins un ami",
            style: TextStyle(color: Colors.red),
          ),
        ),
    ]);
  }
}
