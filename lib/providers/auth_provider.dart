import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ceticy/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  bool _isAuthenticated = false;
  bool _isManager = false;
  String _userName = '';
  String _userEmail = '';
  int _currentFriendCount = 0;
  int _currentLikeCount = 0;
  String? _token;

  bool get isAuthenticated => _isAuthenticated;
  bool get isManager => _isManager;
  String get userName => _userName;
  String get userEmail => _userEmail;
  String? get token => _token;
  int get currentFriendCount => _currentFriendCount;
  int get currentLikeCount => _currentLikeCount;

  void setCurrentLikeCount(int count) {
    _currentLikeCount = count;
  }

  void _resetProvider() {
    _isAuthenticated = false;
    _isManager = false;
    _userName = '';
    _userEmail = '';
    _currentFriendCount = 0;
    _currentLikeCount = 0;
    _token = null;
  }

  Future<void> _updateUserFromResponse(Map<String, dynamic> response) async {
    _isAuthenticated = true;
    _userName = response['name'] ?? '';
    _userEmail = response['email'] ?? '';
    _currentFriendCount = response['currentFriendCount'] ?? 0;
    _currentLikeCount = response['currentLikeCount'] ?? 0;
    _isManager = response['scope'] == 'manager';
  }

  Future<String?> getToken() async {
    var token = await _storage.read(key: 'jwt');
    _token = token;
    return token;
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'jwt', value: token);
    _token = token;
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'jwt');
    _token = null;
  }

  Future<void> checkAuthStatus() async {
    try {
      final response = await AuthService.getAccountInfo();
      if (response != null) {
        await _updateUserFromResponse(response);
        await getToken();
      } else {
        _resetProvider();
      }
    } catch (e) {
      _resetProvider();
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<void> login(String email, String password, String scope) async {
    try {
      final token = await AuthService.login(email, password, scope);
      if (token != null) {
        await saveToken(token);
        await checkAuthStatus();
      }
    } catch (e) {
      _resetProvider();
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<void> register(String email, String password, String username) async {
    try {
      await AuthService.register(email, password, username, "user");
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await deleteToken();
      _resetProvider();
      notifyListeners();
    } catch (e) {
      rethrow;
    } finally {
      notifyListeners();
    }
  }
}
