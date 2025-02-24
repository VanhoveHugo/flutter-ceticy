import 'dart:convert';

import 'package:ceticy/models/api_exception.dart';
import 'package:ceticy/models/poll_model.dart';
import 'package:ceticy/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:ceticy/services/poll_service.dart'; // Importer le service qui contient les fonctions createPoll et deletePoll

class PollProvider with ChangeNotifier {
  late final AuthProvider _authProvider;
  bool _isLoading = false;
  String _errorMessage = '';
  List<Poll> _polls = [];

  List get polls => _polls;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void _startFunction() {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
  }

  void _resetProvider() {
    _polls = [];
    notifyListeners();
  }

  void _onAuthChanged() {
    if (_authProvider.isAuthenticated) {
      // Initialiser les données du fournisseur si l'utilisateur est connecté
    } else {
      _resetProvider();
    }
  }

  PollProvider(AuthProvider authProvider) {
    _authProvider = authProvider;
    _authProvider.addListener(_onAuthChanged);

    if (_authProvider.isAuthenticated) {
      initialize(_authProvider);
    }
  }

  Future<void> initialize(AuthProvider authProvider) async {
    if (!authProvider.isAuthenticated) return;
    if (!authProvider.isManager) {
      fetchAllPolls();
    }
    notifyListeners();
  }

  Future<void> fetchAllPolls() async {
    _resetProvider();
    _startFunction();

    try {
      final token = _authProvider.token;
      if (token == null) {
        throw Exception("Token utilisateur manquant.");
      }

      final String res = await PollService.fetchAllPolls(token);
      final List<dynamic> data = jsonDecode(res);
      _polls = data.map((e) => Poll.fromJson(e)).toList();
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _authProvider.removeListener(_onAuthChanged);
    super.dispose();
  }

  Future<void> createPoll(BuildContext context, String name, List friendsArray,
      int selectedRestaurant) async {
    _startFunction();

    try {
      final token = _authProvider.token;
      if (token == null) {
        throw Exception("Token utilisateur manquant.");
      }

      await PollService.createPoll(
          token, name, friendsArray, selectedRestaurant);

      fetchAllPolls();

      if (!context.mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Sondage créé avec succès!",
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          duration: const Duration(seconds: 3),
        ),
      );
    } catch (error) {
      if (error is ApiException) {
        if (error.kind == "content_limit") {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Vous avez atteint votre limite de sondages.",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
              duration: const Duration(seconds: 5),
            ),
          );
        }
      } else {
        _errorMessage = "Erreur inconnue lors de la création du sondage.";
      }
    } finally {
      Navigator.of(context).pop();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deletePoll(BuildContext context, int pollId) async {
    _startFunction();

    try {
      final token = _authProvider.token;
      if (token == null) {
        throw Exception("Token utilisateur manquant.");
      }
      await PollService.deletePoll(token, pollId);

      fetchAllPolls();

      if (!context.mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Sondage supprimé avec succès!",
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          duration: const Duration(seconds: 3),
        ),
      );
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      Navigator.pop(context);
      _isLoading = false;
      notifyListeners();
    }
  }
}
