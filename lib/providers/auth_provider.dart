import 'package:ceticy/models/api_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ceticy/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  static const String _tokenKey = 'jwt';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  
  bool _isLoading = false;
  String _errorMessage = '';
  bool _isAuthenticated = false;
  bool _isManager = false;
  int _userId = 0;
  String _userName = '';
  String _userEmail = '';
  int _currentFriendCount = 0;
  int _currentLikeCount = 0;
  String? _token;

  // Getters
  bool get isAuthenticated => _isAuthenticated;
  bool get isManager => _isManager;
  int get userId => _userId;
  String get userName => _userName;
  String get userEmail => _userEmail;
  String? get token => _token;
  int get currentFriendCount => _currentFriendCount;
  int get currentLikeCount => _currentLikeCount;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  // Setters
  void setCurrentLikeCount(int count) {
    if (_currentLikeCount != count) {
      _currentLikeCount = count;
      notifyListeners();
    }
  }

  void resetErrorMessage() {
    if (_errorMessage.isNotEmpty) {
      _errorMessage = '';
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
    _isAuthenticated = false;
    _isManager = false;
    _userId = 0;
    _userName = '';
    _userEmail = '';
    _currentFriendCount = 0;
    _currentLikeCount = 0;
    _token = null;
    notifyListeners();
  }

  Future<void> _updateUserFromResponse(Map<String, dynamic> response) async {
    _isAuthenticated = true;
    _userId = response['id'] ?? 0;
    _userName = response['name'] ?? '';
    _userEmail = response['email'] ?? '';
    _currentFriendCount = response['currentFriendCount'] ?? 0;
    _currentLikeCount = response['currentLikeCount'] ?? 0;
    _isManager = response['scope'] == 'manager';
    notifyListeners();
  }

  Future<String?> getToken() async {
    if (_token == null) {
      _token = await _storage.read(key: _tokenKey);
    }
    return _token;
  }

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
    _token = token;
    notifyListeners();
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
    _token = null;
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    try {
      _startLoading();
      final response = await AuthService.getAccountInfo();
      if (response != null) {
        await _updateUserFromResponse(response);
        await getToken();
      } else {
        _resetState();
      }
    } catch (e) {
      await deleteToken();
      _resetState();
      rethrow;
    } finally {
      _stopLoading();
    }
  }

  Future<void> login(BuildContext context, String email, String password, String scope) async {
    if (_isLoading) return;
    
    try {
      _startLoading();
      final token = await AuthService.login(email, password, scope);
      if (token == null) {
        throw Exception("Token utilisateur manquant.");
      }
      await saveToken(token);
      await checkAuthStatus();

      if (!context.mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } catch (error) {
      if (error is ApiException) {
        _errorMessage = error.kind == "content_invalid" || error.kind == "invalid_credentials"
            ? "L'email ou le mot de passe est incorrect."
            : "Une erreur est survenue lors de la connexion.";
      } else {
        _errorMessage = "Une erreur inattendue est survenue.";
      }
      notifyListeners();
    } finally {
      _stopLoading();
    }
  }

  Future<void> register(BuildContext context, String email, String password, String username) async {
    if (_isLoading) return;

    try {
      _startLoading();
      await AuthService.register(email, password, username, "user");

      if (!context.mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Compte créé avec succès.",
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          duration: const Duration(seconds: 3),
        ),
      );
      Navigator.pop(context);
    } catch (error) {
      if (error is ApiException) {
        _errorMessage = _getRegisterErrorMessage(error);
      } else {
        _errorMessage = "Une erreur inattendue est survenue.";
      }
      notifyListeners();
    } finally {
      _stopLoading();
    }
  }

  String _getRegisterErrorMessage(ApiException error) {
    if (error.kind == "content_invalid") {
      return error.content == "email"
          ? "Le format de l'email est invalide."
          : "Le mot de passe doit contenir au moins 6 caractères, une majuscule, une minuscule et un chiffre.";
    } else if (error.kind == "content_duplicate" && error.content == "email") {
      return "Cet email est déjà utilisé.";
    }
    return "Une erreur est survenue lors de l'inscription.";
  }

  Future<void> logout() async {
    try {
      _startLoading();
      await deleteToken();
      _resetState();
    } catch (e) {
      rethrow;
    } finally {
      _stopLoading();
    }
  }

  Future<void> accountDelete() async {
    if (_token == null) {
      throw Exception("Token utilisateur manquant.");
    }

    try {
      _startLoading();
      await AuthService.accountDelete(_token!);
      await deleteToken();
      _resetState();
    } catch (e) {
      rethrow;
    } finally {
      _stopLoading();
    }
  }
}
