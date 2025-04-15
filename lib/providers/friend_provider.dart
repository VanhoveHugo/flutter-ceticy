import 'package:ceticy/models/friend_model.dart';
import 'package:ceticy/services/friend_service.dart';
import 'package:flutter/material.dart';
import 'package:ceticy/providers/auth_provider.dart';

class FriendProvider with ChangeNotifier {
  late final AuthProvider _authProvider;
  bool _isLoading = false;
  String _errorMessage = '';
  List<Friend> _friends = [];

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  List<Friend> get friends => _friends;

  void _resetProvider() {
    notifyListeners();
  }

  void _startFunction() {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
  }


  void _onAuthChanged() {
    if (_authProvider.isAuthenticated) {
      // Initialiser les données du fournisseur si l'utilisateur est connecté
    } else {
      _resetProvider();
    }
  }

  FriendProvider(AuthProvider authProvider) {
    _authProvider = authProvider;
    _authProvider.addListener(_onAuthChanged);

    if (_authProvider.isAuthenticated) {
      initialize(_authProvider);
    }
  }

  Future<void> initialize(AuthProvider authProvider) async {
    if (!authProvider.isAuthenticated) return;
    fetchAllFriends();
    notifyListeners();
  }

  @override
  void dispose() {
    _authProvider.removeListener(_onAuthChanged);
    super.dispose();
  }

  Future<void> fetchAllFriends() async {
    _resetProvider();
    _startFunction();

    try {
      final token = _authProvider.token;
      if (token == null) {
        throw Exception("Token utilisateur manquant.");
      }

      final List<dynamic> res = await FriendService.fetchAllFriends(token);
      _friends = res.map((e) => Friend.fromJson(e)).toList();
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
