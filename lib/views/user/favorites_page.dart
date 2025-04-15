import 'package:ceticy/core/utils/helpers.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:ceticy/views/user/widgets/favorites/favorites_not_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  FavoritesPageSatet createState() => FavoritesPageSatet();
}

class FavoritesPageSatet extends State<FavoritesPage> {
  bool isInCategory = false;
  late Category currentCategory;
  var searchController = TextEditingController();
  List<Restaurant> _filteredRestaurants = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      _filterRestaurants();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_filterRestaurants);
    searchController.dispose();
    super.dispose();
  }

  void _filterRestaurants() {
    if (!isInCategory) return;

    if (searchController.text.isEmpty) {
      setState(() {
        _filteredRestaurants = [];
      });
      return;
    }

    setState(() {
      _filteredRestaurants = currentCategory.restaurants
          .where((restaurant) => restaurant.name
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final swipedRestaurants = restaurantProvider.swipedRestaurants;
    final likedRestaurants = restaurantProvider.likedRestaurants;

    if (swipedRestaurants.isEmpty && likedRestaurants.isEmpty) {
      return const FavoritesNotFound();
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            if (isInCategory)
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    onPressed: () {
                      setState(() {
                        isInCategory = false;
                      });
                    },
                  ),
                  Text(
                    currentCategory.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            if (isInCategory) const SizedBox(height: 16),
            if (isInCategory)
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        _filterRestaurants();
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        hintText: "Rechercher un restaurant",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  if (!isInCategory) const SizedBox(width: 16),
                  if (!isInCategory)
                    IconButton(
                      icon: Icon(Icons.add,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          size: 30),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            Theme.of(context).colorScheme.onSurface),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {},
                    ),
                ],
              ),
            const SizedBox(height: 24),
            if (!isInCategory && categories.isNotEmpty)
              buildCateogries(categories),
            if (isInCategory && searchController.text.isEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: currentCategory.restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = currentCategory.restaurants[index];

                    String estimatedTime = RestaurantProvider.getEstimatedTime(
                        restaurant.averageService);
                    String priceRange =
                        restaurant.averagePrice?.toString() ?? "";
                    return ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        width: 60,
                        height: 70,
                        child: getThumbnail(currentCategory.restaurants[index]),
                      ),
                      title: Text(restaurant.name),
                      subtitle: Row(
                        children: [
                          estimatedTime != ""
                              ? Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Time-Circle.svg',
                                      width: 20,
                                      height: 20,
                                      colorFilter: ColorFilter.mode(
                                        Theme.of(context).colorScheme.primary,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      estimatedTime,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                  ],
                                )
                              : Container(),
                          priceRange != ""
                              ? Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Card.svg',
                                      width: 24,
                                      height: 24,
                                      colorFilter: ColorFilter.mode(
                                        Theme.of(context).colorScheme.primary,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    for (var i = 0; i < 3; i++)
                                      Icon(
                                        Icons.euro,
                                        color: i < int.parse(priceRange)
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                            : Colors.grey,
                                        size: 14,
                                      ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                      onTap: () {},
                    );
                  },
                ),
              ),
            if (isInCategory && searchController.text.isNotEmpty)
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.surface,
                      width: 2,
                    ),
                  ),
                ),
                child: ListView.builder(
                  itemCount: _filteredRestaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = _filteredRestaurants[index];

                    String estimatedTime = RestaurantProvider.getEstimatedTime(
                        restaurant.averageService);
                    String priceRange =
                        restaurant.averagePrice?.toString() ?? "";
                    return ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        width: 60,
                        height: 70,
                        child: getThumbnail(_filteredRestaurants[index]),
                      ),
                      title: Text(restaurant.name),
                      subtitle: Row(
                        children: [
                          estimatedTime != ""
                              ? Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Time-Circle.svg',
                                      width: 20,
                                      height: 20,
                                      colorFilter: ColorFilter.mode(
                                        Theme.of(context).colorScheme.primary,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      estimatedTime,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                  ],
                                )
                              : Container(),
                          priceRange != ""
                              ? Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Card.svg',
                                      width: 24,
                                      height: 24,
                                      colorFilter: ColorFilter.mode(
                                        Theme.of(context).colorScheme.primary,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    for (var i = 0; i < 3; i++)
                                      Icon(
                                        Icons.euro,
                                        color: i < int.parse(priceRange)
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                            : Colors.grey,
                                        size: 14,
                                      ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                      onTap: () {
                      },
                    );
                  },
                ),
              )),
          ],
        ),
      ),
    );
  }

  Widget buildCateogries(List<Category> categories) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                isInCategory = true;
                currentCategory = category;
              });
              _filterRestaurants();
            },
            child: CategoryTile(category: category),
          );
        },
      ),
    );
  }
}

class Category {
  final String title;
  final String subtitle;
  final List<Restaurant> restaurants;

  Category(
      {required this.title, required this.subtitle, required this.restaurants});

  void updateRestaurants(List<Restaurant> newRestaurants) {
    restaurants.clear();
    restaurants.addAll(newRestaurants);
  }
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
      padding: const EdgeInsets.all(8),
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
                return getThumbnail(category.restaurants[index]);
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
    );
  }
}
