import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurants = Provider.of<RestaurantProvider>(context).restaurants;

    if (restaurants.isEmpty) {
      return const Center(
        child: Text('Aucun restaurant disponible'),
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/restaurants/create');
                  },
                  child: const Text('Ajouter un restaurant'),
                ),
              ),
              Text(
                'Vos restaurants',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 90,
                child: Stack(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: restaurants.length,
                      itemBuilder: (context, index) {
                        final restaurant = restaurants[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: RestaurantCard(
                              restaurant: restaurant, index: index),
                        );
                      },
                    ),
                    Positioned.fill(
                      left: 0,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 20,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).scaffoldBackgroundColor,
                                Theme.of(context)
                                    .scaffoldBackgroundColor
                                    .withValues(alpha: 0),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      right: 0,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 20,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context)
                                    .scaffoldBackgroundColor
                                    .withValues(alpha: 0),
                                Theme.of(context).scaffoldBackgroundColor
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Statistiques',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nombre de visites',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '?',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nombre total de restaurants visités',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '?',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 125,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nombre total d\'avis client',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '?',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final int index;

  const RestaurantCard(
      {super.key, required this.restaurant, required this.index});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        (restaurant.photos != null && restaurant.photos!.isNotEmpty)
            ? restaurant.photos!.first
            : "https://via.placeholder.com/150";

    return GestureDetector(
      onLongPress: () {
        _showPopupMenu(context, index);
      },
      onTap: () {
        Navigator.pushNamed(context, '/restaurant/${restaurant.id}');
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      color: Colors.grey,
                      child: const Icon(Icons.error, color: Colors.white),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour afficher le PopupMenuButton
  void _showPopupMenu(BuildContext context, int index) async {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
      items: [
        const PopupMenuItem(
          value: 'delete',
          child: Text('Supprimer'),
        ),
      ],
    ).then((value) {
      if (value == 'delete') {
        // final restaurantProvider = Provider.of<RestaurantProvider>(context, listen: false);
        // restaurantProvider.removeRestaurant(index);
      }
    });
  }
}
