import 'package:ceticy/providers/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ceticy/generated/app_localizations.dart';

class SwipeProvider extends ChangeNotifier {
  Offset position = Offset.zero;
  double rotation = 0;
  bool isSwiping = false;
  int realIndex = 0;
  String? swipeAction;
  double threshold = 100;
  bool isDescriptionVisible = false;
  int selectedMenuItem = 0;

  setSwipeAction(String action) {
    if (swipeAction != action) {
      swipeAction = action;
      notifyListeners();
    }
  }

  setRealIndex(int index) {
    if (realIndex != index) {
      realIndex = index;
      notifyListeners();
    }
  }

  void onPanUpdate(Offset delta) {
    if (isDescriptionVisible) return;

    position += delta;
    rotation = -position.dx / 1000;
    isSwiping = true;

    String? newAction;
    if (position.dy < -50) {
      newAction = "superlike";
    } else if (position.dx > 50) {
      newAction = "like";
    } else if (position.dx < -50) {
      newAction = "dislike";
    }

    if (newAction != swipeAction) {
      swipeAction = newAction;
    }
    notifyListeners();
  }

  void resetPosition() {
    position = Offset.zero;
    rotation = 0;
    isSwiping = false;
    swipeAction = null;
    notifyListeners();
  }

  void onPanEnd(BuildContext context, int restaurantId) {
    if (swipeAction != null) {
      realIndex = restaurantId;
      notifySwipe(context, swipeAction!, restaurantId);
    } else {
      resetPosition();
    }
  }

  void onTap(BuildContext context, Offset tapPosition) {
    final double cardHeight = MediaQuery.of(context).size.height;

    if (isDescriptionVisible) {
      toggleDescription();
      return;
    }

    if (tapPosition.dy > cardHeight / 2) {
      isDescriptionVisible = !isDescriptionVisible;
      notifyListeners();
    }
  }

  void ejectCard(double endX, double endY) {
    position = Offset(endX, endY);
    isDescriptionVisible = false;
    notifyListeners();
    resetPosition();
  }

  void notifySwipe(BuildContext context, String action, int restaurantId) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context, listen: false);

    restaurantProvider.handleRestaurantSwipe(action, restaurantId);
    ejectCard(position.dx > 0 ? 500 : -500, 0);
  }

  void toggleDescription() {
    isDescriptionVisible = !isDescriptionVisible;
    notifyListeners();
  }

  void setSelectedMenuItem(int index) {
    selectedMenuItem = index;
    notifyListeners();
  }

  List<String> getMenuItems(BuildContext context) {
    return [
      AppLocalizations.of(context)!.about,
      AppLocalizations.of(context)!.menu,
      AppLocalizations.of(context)!.gallery,
      AppLocalizations.of(context)!.reviews,
    ];
  }
}
