import 'package:flutter/material.dart';
import 'package:ceticy/core/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});
  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class Restaurant {
  final String name;
  final String description;
  final String picture;
  // 1 to 5 with decimal
  final double rating;
  // image url
  final String image;
  // time to get served
  final String duration;
  // 1 = $, 2 = $$, 3 = $$$
  final int budget;
  // time to get there
  final double distance;

  Restaurant(this.name, this.description, this.picture, this.image, this.rating,
      this.duration, this.budget, this.distance);
}

class _SwipeScreenState extends State<SwipeScreen> {
  List<SwipeItem> _swipeItems = [];
  late MatchEngine _matchEngine;
  bool _isStackFinished = false;

  List<Restaurant> restaurants = [
    Restaurant('Ramen-toi', 'Description 1', 'assets/images/restaurant1.jpg',
        'assets/images/image1.jpg', 4.5, '30 min', 2, 1.5),
    Restaurant(
        'Fresh & Juicy',
        'Description 2',
        'assets/images/restaurant2.jpg',
        'assets/images/image2.jpg',
        4.0,
        '20 min',
        1,
        2.0),
    Restaurant('Lemon Club', 'Description 3', 'assets/images/restaurant3.jpg',
        'assets/images/image3.jpg', 4.7, '25 min', 3, 1.0),
  ];

  @override
  void initState() {
    super.initState();

    for (var restaurant in restaurants) {
      _swipeItems.add(SwipeItem(
        content: restaurant,
        likeAction: () {
          print('Liked ${restaurant.name}');
        },
        nopeAction: () {
          print('Nope ${restaurant.name}');
        },
      ));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _isStackFinished || _swipeItems.isEmpty
          ? const Center(
              child: Text(
                "Nous sommes à la recherche de plus de restaurant insolite",
                style: appText,
                textAlign: TextAlign.center,
              ),
            )
          : SwipeCards(
              matchEngine: _matchEngine,
              itemBuilder: (BuildContext context, int index) {
                Restaurant restaurant = _swipeItems[index].content;
                return Card(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(32)),
                          child: SizedBox.expand(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                restaurant.picture,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.black87,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // circle white
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(restaurant.picture),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                      ),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                  ),
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),

                                  const SizedBox(width: 16),
                                  Text(
                                    restaurant.name,
                                    style: appTextBrand,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    restaurant.rating.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                ],
                              )
                            ],
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
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.black87,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/Time-Circle.svg',
                                      width: 20,
                                      height: 20,
                                      color: ThemeColor.primary,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      restaurant.duration,
                                      style: const TextStyle(
                                        color: Colors.white,
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
                                      color: ThemeColor.primary,
                                    ),
                                    const SizedBox(width: 5),
                                    for (var i = 0; i < 3; i++)
                                      Icon(
                                        Icons.euro,
                                        color: i < restaurant.budget
                                            ? Colors.white
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
                                      color: ThemeColor.primary,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "${restaurant.distance} km",
                                      style: const TextStyle(
                                        color: Colors.white,
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
                  _isStackFinished = true;
                });
              },
              itemChanged: (SwipeItem item, int index) {},
              fillSpace: true,
            ),
    );
  }
}
