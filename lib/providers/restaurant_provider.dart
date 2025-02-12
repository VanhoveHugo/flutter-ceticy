import 'dart:io';
import 'package:ceticy/models/api_exception.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:ceticy/services/restaurant_service.dart';
import 'package:flutter/material.dart';
import 'package:ceticy/services/swipe_service.dart';

class RestaurantProvider with ChangeNotifier {
  late final AuthProvider _authProvider;
  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  List<Restaurant> _restaurants = [];
  List<Restaurant> _swipedRestaurants = [];
  List<Restaurant> _likedRestaurants = [];

  List<Restaurant> get restaurants => _restaurants;
  List<Restaurant> get swipedRestaurants => _swipedRestaurants;
  List<Restaurant> get likedRestaurants => _likedRestaurants;

  void _startFunction() {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
  }

  void _resetProvider() {
    _restaurants = [];
    notifyListeners();
  }

  void _onAuthChanged() {
    if (_authProvider.isAuthenticated) {
      initialize(_authProvider);
    } else {
      _resetProvider();
    }
  }

  RestaurantProvider(AuthProvider authProvider) {
    _authProvider = authProvider;
    _authProvider.addListener(_onAuthChanged);

    if (_authProvider.isAuthenticated) {
      initialize(_authProvider);
    }
  }

  @override
  void dispose() {
    _authProvider.removeListener(_onAuthChanged);
    super.dispose();
  }

  Future<void> fetchManagerRestaurants() async {
    _isLoading = true;
    notifyListeners();

    try {
      var token = _authProvider.token;

      final restaurants =
          await RestaurantService.fetchManagerRestaurants(token!);
      _restaurants = restaurants;
    } catch (error) {
      _restaurants = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchRandomRestaurants() async {
    _isLoading = true;
    notifyListeners();

    try {
      var token = _authProvider.token;
      final restaurants = await RestaurantService.fetchRestaurants(token!);
      _restaurants = restaurants;
    } catch (error) {
      _restaurants = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchLikedRestaurants() async {
    _isLoading = true;
    notifyListeners();

    try {
      var token = _authProvider.token;
      final restaurants = await RestaurantService.fetchLikeRestaurants(token!);
      _likedRestaurants.addAll(restaurants);
    } catch (error) {
      _likedRestaurants.clear();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> initialize(AuthProvider authProvider) async {
    if (!authProvider.isAuthenticated) return;
    if (authProvider.isManager) {
      await fetchManagerRestaurants();
    } else {
      await fetchRandomRestaurants();
      await fetchLikedRestaurants();
    }
    notifyListeners();
  }

  Future<void> handleRestaurantSwipe(String action, int restaurantId) async {
    try {
      String token = _authProvider.token ?? '';
      await handleSwipeAction(token, action, restaurantId);

      final swipedRestaurant = _restaurants.firstWhere(
        (restaurant) => restaurant.id == restaurantId,
      );

      _restaurants.remove(swipedRestaurant);
      _swipedRestaurants = [swipedRestaurant, ..._swipedRestaurants];

      if (action == 'like') {
        _likedRestaurants = [swipedRestaurant, ..._likedRestaurants];
        _authProvider.setCurrentLikeCount(_authProvider.currentLikeCount + 1);
      }

      notifyListeners();
    } catch (error) {}
  }

  static String getEstimatedTime(int? averageService) {
    switch (averageService) {
      case 1:
        return "15 min";
      case 2:
        return "30 min";
      case 3:
        return "45 min";
      default:
        return "";
    }
  }

  Future<void> createRestaurant(
    BuildContext context,
    String name,
    String description,
    int averagePrice,
    int averageService,
    String phoneNumber,
    File thumbnail,
  ) async {
    _startFunction();

    try {
      final token = _authProvider.token;
      if (token == null) {
        throw Exception("Token utilisateur manquant.");
      }

      await RestaurantService.createRestaurant(token, name, description,
          averagePrice, averageService, phoneNumber, thumbnail);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Restaurant ajouté avec succès!",
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          duration: const Duration(seconds: 3),
        ),
      );

      Navigator.of(context).pop();
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      } else {
        throw Exception("Erreur réseau ou autre: $e");
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
