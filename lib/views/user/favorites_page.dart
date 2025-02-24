import 'package:ceticy/core/widgets/image_displayer.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:ceticy/views/user/restaurants/restaurants_liste_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final swipedRestaurants = restaurantProvider.swipedRestaurants;
    final likedRestaurants = restaurantProvider.likedRestaurants;

    if (swipedRestaurants.isEmpty && likedRestaurants.isEmpty) {
      return const Center(
        child: Text("Aucun lieu approuvé ou récent"),
      );
    }

    final swipedCategory = swipedRestaurants.isNotEmpty
        ? Category(
            title: "Récents",
            subtitle: "${swipedRestaurants.length} lieux",
            restaurants: swipedRestaurants)
        : null;

    final likedCategory = likedRestaurants.isNotEmpty
        ? Category(
            title: "Like",
            subtitle: "${likedRestaurants.length} lieux",
            restaurants: likedRestaurants)
        : null;

    final categories = <Category>[];

    if (swipedCategory != null) {
      categories.add(swipedCategory);
    }

    if (likedCategory != null) {
      categories.add(likedCategory);
    }

    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RestaurantListPage(category: category),
                          ),
                        );
                      },
                      child: CategoryTile(category: category),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}

class Category {
  final String title;
  final String subtitle;
  final List<Restaurant> restaurants;

  Category(
      {required this.title, required this.subtitle, required this.restaurants});
}

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 1,
                ),
                itemCount: category.restaurants.length,
                itemBuilder: (context, index) {
                  return ImageDisplayer(
                      restaurant: category.restaurants[index]);
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              category.subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
