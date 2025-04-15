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
  List<Restaurant> _restaurants = [];
  List<Restaurant> _swipedRestaurants = [];
  List<Restaurant> _likedRestaurants = [];
  Restaurant? _currentRestaurantManager;
  int _loadedRestaurantsCount = 0;
  bool _showAd = false;
  bool _isFirstLoad = true;

  // Getters
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  List<Restaurant> get restaurants => List.unmodifiable(_restaurants);
  List<Restaurant> get swipedRestaurants => List.unmodifiable(_swipedRestaurants);
  List<Restaurant> get likedRestaurants => List.unmodifiable(_likedRestaurants);
  Restaurant? get currentRestaurantManager => _currentRestaurantManager;
  bool get showAd => _showAd;

  // Setters
  void setCurrentRestaurantManager(Restaurant restaurant) {
    if (_currentRestaurantManager?.id != restaurant.id) {
      _currentRestaurantManager = restaurant;
      notifyListeners();
    }
  }

  void _startLoading() {
    if (!_isLoading) {
      _isLoading = true;
      _errorMessage = '';
      notifyListeners();
    }
  }

  void _stopLoading() {
    if (_isLoading) {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _resetState() {
    _restaurants = [];
    _swipedRestaurants = [];
    _likedRestaurants = [];
    _currentRestaurantManager = null;
    notifyListeners();
  }

  void _onAuthChanged() {
    if (_authProvider.isAuthenticated) {
      initialize(_authProvider);
    } else {
      _resetState();
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
    if (_isLoading) return;

    try {
      _startLoading();
      final token = _authProvider.token;
      if (token == null) throw Exception("Token utilisateur manquant.");

      final restaurants = await RestaurantService.fetchManagerRestaurants(token);
      _restaurants = restaurants;
      notifyListeners();
    } catch (error) {
      _restaurants = [];
      _errorMessage = error.toString();
      notifyListeners();
    } finally {
      _stopLoading();
    }
  }

  Future<void> fetchRandomRestaurants() async {
    try {
      setLoading(true);
      final token = _authProvider.token;
      if (token == null) throw Exception("Token utilisateur manquant.");

      final newRestaurants = await RestaurantService.fetchRestaurants(token);

      if (newRestaurants.isNotEmpty) {
        _restaurants.addAll(newRestaurants);
        _loadedRestaurantsCount += newRestaurants.length;
        
        if (!_isFirstLoad && _loadedRestaurantsCount >= 20) {
          _showAd = true;
          _loadedRestaurantsCount = 0;
        }
        
        _isFirstLoad = false;
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching random restaurants: $e');
    } finally {
      setLoading(false);
    }
  }

  void setState(List<Restaurant> newRestaurants) {
    _restaurants = newRestaurants;
    notifyListeners();
  }

  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> fetchLikedRestaurants() async {
    if (_isLoading) return;

    try {
      _startLoading();
      final token = _authProvider.token;
      if (token == null) throw Exception("Token utilisateur manquant.");

      final restaurants = await RestaurantService.fetchLikeRestaurants(token);
      _likedRestaurants = restaurants;
      notifyListeners();
    } catch (error) {
      _likedRestaurants = [];
      _errorMessage = error.toString();
      notifyListeners();
    } finally {
      _stopLoading();
    }
  }

  Future<void> initialize(AuthProvider authProvider) async {
    if (!authProvider.isAuthenticated) return;

    try {
      if (authProvider.isManager) {
        await fetchManagerRestaurants();
        _currentRestaurantManager = _restaurants.isNotEmpty ? _restaurants.last : null;
      } else {
        await fetchRandomRestaurants();
        await fetchLikedRestaurants();
      }
    } catch (error) {
      _errorMessage = error.toString();
      notifyListeners();
    } finally {
      _stopLoading();
    }
  }

  bool _shouldReloadRestaurants() {
    return _restaurants.isEmpty && !_isLoading;
  }

  Future<void> handleRestaurantSwipe(String action, int restaurantId) async {
    if (_isLoading) return;

    try {
      print("action: $action restaurantId: $restaurantId");

      final token = _authProvider.token;
      if (token == null) throw Exception("Token utilisateur manquant.");

      await handleSwipeAction(token, action, restaurantId);

      final swipedRestaurant = _restaurants.firstWhere(
        (restaurant) => restaurant.id == restaurantId,
        orElse: () => throw Exception("Restaurant non trouvé"),
      );

      _restaurants.remove(swipedRestaurant);
      _swipedRestaurants = [swipedRestaurant, ..._swipedRestaurants];

      if (action == 'like') {
        _likedRestaurants = [swipedRestaurant, ..._likedRestaurants];
        _authProvider.setCurrentLikeCount(_authProvider.currentLikeCount + 1);
      }

      notifyListeners();

      if (_shouldReloadRestaurants()) {
        _startLoading();
        await fetchRandomRestaurants();
      }
    } catch (error) {
      _errorMessage = error.toString();
      notifyListeners();
    } finally {
      _stopLoading();
    }
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
    dynamic thumbnail,
  ) async {
    _startLoading();

    try {
      final token = _authProvider.token;
      if (token == null) {
        throw Exception("Token utilisateur manquant.");
      }

      await RestaurantService.createRestaurant(token, name, description,
          averagePrice, averageService, phoneNumber, thumbnail);

      if (!context.mounted) {
        return;
      }

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

      Navigator.pop(context);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      } else {
        throw Exception(e);
      }
    } finally {
      _stopLoading();
      notifyListeners();
    }
  }

  void hideAd() {
    _showAd = false;
    notifyListeners();
  }
}
