import 'package:flutter/foundation.dart';
import '../models/cuisine_type.dart';
import '../models/ambiance.dart';
import '../models/theme.dart';
import '../models/price.dart';
import '../models/service.dart';
import '../models/options.dart';
import '../models/distance.dart';
import '../models/events.dart';

class PreferencesProvider with ChangeNotifier {
  List<CuisineType> _cuisineTypes = [];
  List<Ambiance> _ambiances = [];
  List<ThemePreference> _themes = [];
  List<PricePreference> _prices = [];
  List<ServicePreference> _services = [];
  List<OptionsPreference> _options = [];
  List<DistancePreference> _distances = [];
  List<EventsPreference> _events = [];

  PreferencesProvider() {
    _loadInitialData();
  }

  // Getters
  List<CuisineType> get cuisineTypes => _cuisineTypes;
  List<Ambiance> get ambiances => _ambiances;
  List<ThemePreference> get themes => _themes;
  List<PricePreference> get prices => _prices;
  List<ServicePreference> get services => _services;
  List<OptionsPreference> get options => _options;
  List<DistancePreference> get distances => _distances;
  List<EventsPreference> get events => _events;

  // Selected getters
  List<CuisineType> get selectedCuisineTypes => _cuisineTypes.where((type) => type.isSelected).toList();
  List<Ambiance> get selectedAmbiances => _ambiances.where((ambiance) => ambiance.isSelected).toList();
  List<ThemePreference> get selectedThemes => _themes.where((theme) => theme.isSelected).toList();
  List<PricePreference> get selectedPrices => _prices.where((price) => price.isSelected).toList();
  List<ServicePreference> get selectedServices => _services.where((service) => service.isSelected).toList();
  List<OptionsPreference> get selectedOptions => _options.where((option) => option.isSelected).toList();
  List<DistancePreference> get selectedDistances => _distances.where((distance) => distance.isSelected).toList();
  List<EventsPreference> get selectedEvents => _events.where((event) => event.isSelected).toList();

  void _loadInitialData() {
    // Load cuisine types
    _cuisineTypes = [
      CuisineType(id: '1', name: 'Italienne'),
      CuisineType(id: '2', name: 'Française'),
      CuisineType(id: '3', name: 'Mexicaine'),
      CuisineType(id: '4', name: 'Japonaise'),
      CuisineType(id: '5', name: 'Chinoise'),
      CuisineType(id: '6', name: 'Indienne'),
      CuisineType(id: '7', name: 'Américaine'),
    ];

    // Load ambiances
    _ambiances = [
      Ambiance(id: '1', name: 'Décontracté'),
      Ambiance(id: '2', name: 'Chic/Élégant'),
      Ambiance(id: '3', name: 'Moderne'),
      Ambiance(id: '4', name: 'Traditionnel'),
      Ambiance(id: '5', name: 'Rustique'),
      Ambiance(id: '6', name: 'Animé'),
      Ambiance(id: '7', name: 'Intime'),
      Ambiance(id: '8', name: 'Vue panoramique'),
      Ambiance(id: '9', name: 'Vue sur la mer'),
      Ambiance(id: '10', name: 'Vue sur la montagne'),
    ];

    // Load themes
    _themes = [
      ThemePreference(id: '1', name: 'Café'),
      ThemePreference(id: '2', name: 'Bistro'),
      ThemePreference(id: '3', name: 'Bar à vin'),
      ThemePreference(id: '4', name: 'Lounge'),
      ThemePreference(id: '5', name: 'Taverne/Pub'),
      ThemePreference(id: '6', name: 'Brasserie'),
      ThemePreference(id: '7', name: 'Gastronomie'),
      ThemePreference(id: '8', name: 'Barbecue/Grill'),
      ThemePreference(id: '9', name: 'Pizzeria'),
    ];

    // Load prices
    _prices = [
      PricePreference(id: '1', name: '€', minPrice: 0, maxPrice: 10),
      PricePreference(id: '2', name: '€€', minPrice: 10, maxPrice: 25),
      PricePreference(id: '3', name: '€€€', minPrice: 25, maxPrice: 50),
      PricePreference(id: '4', name: '€€€€', minPrice: 50, maxPrice: 0),
    ];

    // Load services
    _services = [
      ServicePreference(id: '1', name: 'Service au comptoir'),
      ServicePreference(id: '2', name: 'Service à table'),
      ServicePreference(id: '3', name: 'Service en buffet'),
      ServicePreference(id: '4', name: 'Livraison'),
      ServicePreference(id: '5', name: 'Plats à emporter'),
      ServicePreference(id: '6', name: 'Réservation'),
      ServicePreference(id: '7', name: 'Parking'),
      ServicePreference(id: '8', name: 'Accès PMR'),
    ];

    // Load options
    _options = [
      OptionsPreference(id: '1', name: 'Vegan'),
      OptionsPreference(id: '2', name: 'Vegetarien'),
      OptionsPreference(id: '3', name: 'Sans gluten'),
      OptionsPreference(id: '4', name: 'Halal'),
      OptionsPreference(id: '5', name: 'Casher'),
      OptionsPreference(id: '6', name: 'Menu enfant'),
      OptionsPreference(id: '7', name: 'Happy hour'),
      OptionsPreference(id: '6', name: 'Brunch'),
    ];

    // Load distances
    _distances = [
      DistancePreference(id: '1', name: 'À proximité', maxDistance: 0),
      DistancePreference(id: '2', name: '5-10 minutes à pied', maxDistance: 1),
      DistancePreference(id: '3', name: '10-20 minutes en transport', maxDistance: 3),
      DistancePreference(id: '4', name: '20-30 minutes en transport', maxDistance: 5),
      DistancePreference(id: '5', name: 'Au-delà de 30 minutes en transport', maxDistance: 10),
    ];

    // Load events
    _events = [
      EventsPreference(id: '1', name: 'Soirées à thème'),
      EventsPreference(id: '2', name: 'Musique live'),
      EventsPreference(id: '3', name: 'Spéctacles/Divertissements'),
      EventsPreference(id: '4', name: 'Événements sportifs diffusés'),
      EventsPreference(id: '5', name: 'Dégustations de vins/Alcools'),
      EventsPreference(id: '6', name: 'Cours de cuisine'),
      EventsPreference(id: '7', name: 'Cours de mixologie'),
    ];

    notifyListeners();
  }

  // Toggle methods
  void toggleCuisineType(String id) {
    final index = _cuisineTypes.indexWhere((type) => type.id == id);
    if (index != -1) {
      _cuisineTypes[index] = _cuisineTypes[index].copyWith(
        isSelected: !_cuisineTypes[index].isSelected,
      );
      notifyListeners();
    }
  }

  void toggleAmbiance(String id) {
    final index = _ambiances.indexWhere((ambiance) => ambiance.id == id);
    if (index != -1) {
      _ambiances[index] = _ambiances[index].copyWith(
        isSelected: !_ambiances[index].isSelected,
      );
      notifyListeners();
    }
  }

  void toggleTheme(String id) {
    final index = _themes.indexWhere((theme) => theme.id == id);
    if (index != -1) {
      _themes[index] = _themes[index].copyWith(
        isSelected: !_themes[index].isSelected,
      );
      notifyListeners();
    }
  }

  void togglePrice(String id) {
    final index = _prices.indexWhere((price) => price.id == id);
    if (index != -1) {
      _prices[index] = _prices[index].copyWith(
        isSelected: !_prices[index].isSelected,
      );
      notifyListeners();
    }
  }

  void toggleService(String id) {
    final index = _services.indexWhere((service) => service.id == id);
    if (index != -1) {
      _services[index] = _services[index].copyWith(
        isSelected: !_services[index].isSelected,
      );
      notifyListeners();
    }
  }

  void toggleOption(String id) {
    final index = _options.indexWhere((option) => option.id == id);
    if (index != -1) {
      _options[index] = _options[index].copyWith(
        isSelected: !_options[index].isSelected,
      );
      notifyListeners();
    }
  }

  void toggleDistance(String id) {
    final index = _distances.indexWhere((distance) => distance.id == id);
    if (index != -1) {
      _distances[index] = _distances[index].copyWith(
        isSelected: !_distances[index].isSelected,
      );
      notifyListeners();
    }
  }

  void toggleEvent(String id) {
    final index = _events.indexWhere((event) => event.id == id);
    if (index != -1) {
      _events[index] = _events[index].copyWith(
        isSelected: !_events[index].isSelected,
      );
      notifyListeners();
    }
  }

  // Clear methods
  void clearCuisineTypes() {
    for (var i = 0; i < _cuisineTypes.length; i++) {
      _cuisineTypes[i] = _cuisineTypes[i].copyWith(isSelected: false);
    }
    notifyListeners();
  }

  void clearAmbiances() {
    for (var i = 0; i < _ambiances.length; i++) {
      _ambiances[i] = _ambiances[i].copyWith(isSelected: false);
    }
    notifyListeners();
  }

  void clearThemes() {
    for (var i = 0; i < _themes.length; i++) {
      _themes[i] = _themes[i].copyWith(isSelected: false);
    }
    notifyListeners();
  }

  void clearPrices() {
    for (var i = 0; i < _prices.length; i++) {
      _prices[i] = _prices[i].copyWith(isSelected: false);
    }
    notifyListeners();
  }

  void clearServices() {
    for (var i = 0; i < _services.length; i++) {
      _services[i] = _services[i].copyWith(isSelected: false);
    }
    notifyListeners();
  }

  void clearOptions() {
    for (var i = 0; i < _options.length; i++) {
      _options[i] = _options[i].copyWith(isSelected: false);
    }
    notifyListeners();
  }

  void clearDistances() {
    for (var i = 0; i < _distances.length; i++) {
      _distances[i] = _distances[i].copyWith(isSelected: false);
    }
    notifyListeners();
  }

  void clearEvents() {
    for (var i = 0; i < _events.length; i++) {
      _events[i] = _events[i].copyWith(isSelected: false);
    }
    notifyListeners();
  }

  void clearAll() {
    clearCuisineTypes();
    clearAmbiances();
    clearThemes();
    clearPrices();
    clearServices();
    clearOptions();
    clearDistances();
    clearEvents();
  }
} 