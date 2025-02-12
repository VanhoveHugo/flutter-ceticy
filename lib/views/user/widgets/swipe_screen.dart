import 'package:ceticy/core/widgets/image_displayer.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SwipeScreen extends StatefulWidget {
  final Function(bool) onStackFinished;
  const SwipeScreen({super.key, required this.onStackFinished});

  @override
  State<SwipeScreen> createState() => SwipeScreenState();
}

class SwipeScreenState extends State<SwipeScreen> {
  late MatchEngine _matchEngine;

  @override
  void initState() {
    super.initState();
  }

  void triggerLikeAction() {
    if (_matchEngine.currentItem != null) {
      _matchEngine.currentItem!.likeAction!();
    }
  }

  void triggerNopeAction() {
    if (_matchEngine.currentItem != null) {
      _matchEngine.currentItem!.nopeAction!();
    }
  }

  void triggerSuperLikeAction() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
                    labelPadding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 14,
                    ),
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 3,
                        ),
                      ),
                    ),
                    tabs: const [
                      Tab(text: 'À propos'),
                      Tab(text: 'Menu'),
                      Tab(text: 'Galerie'),
                      Tab(text: 'Avis'),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        Text('À propos'),
                        Text('Menu'),
                        Text('Galerie'),
                        Text('Avis'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, restaurantProvider, child) {
        if (restaurantProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (restaurantProvider.restaurants.isEmpty) {
          return Center(
            child: Text(
              "Nous sommes à la recherche de plus de restaurants insolites",
              style: TextStyle(
                  fontSize: 18, color: Theme.of(context).colorScheme.onSurface),
              textAlign: TextAlign.center,
            ),
          );
        }

        List<SwipeItem> swipeItems =
            restaurantProvider.restaurants.map((restaurant) {
          return SwipeItem(
              content: restaurant,
              likeAction: () async {
                await restaurantProvider.handleRestaurantSwipe(
                    "like", restaurant.id);
              },
              nopeAction: () async {
                await restaurantProvider.handleRestaurantSwipe(
                    "dislike", restaurant.id);
              },
              superlikeAction: () {
                triggerSuperLikeAction();
              });
        }).toList();

        _matchEngine = MatchEngine(swipeItems: swipeItems);

        return Expanded(
          child: SwipeCards(
            matchEngine: _matchEngine,
            itemBuilder: (BuildContext context, int index) {
              Restaurant restaurant = swipeItems[index].content;

              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                color: Theme.of(context).colorScheme.surface,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24)),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: ImageDisplayer(restaurant: restaurant)
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Theme.of(context)
                                .scaffoldBackgroundColor
                                .withValues(alpha: 0.8)),
                        child: Text(
                          restaurant.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                          padding: const EdgeInsets.all(24),
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withValues(alpha: 0.8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
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
                                    "30min",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Row(
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
                                      color: i < 2
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                          : Colors.grey,
                                      size: 14,
                                    ),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/Location.svg',
                                    width: 24,
                                    height: 24,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context).colorScheme.primary,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "10 km",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              );
            },
            onStackFinished: () {
              setState(() {
                widget.onStackFinished(true);
              });
            },
            upSwipeAllowed: true,
            itemChanged: (SwipeItem item, int index) {},
            fillSpace: true,
          ),
        );
      },
    );
  }
}
