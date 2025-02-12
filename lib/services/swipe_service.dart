import 'package:ceticy/core/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const storage = FlutterSecureStorage();

Future<String> handleSwipeAction(String token, String action, int restaurantId) async {
  try {
    final body = jsonEncode({
      "action": action,
      "restaurantId": restaurantId,
    });

    final response = await http.post(
      Uri.parse('$apiBaseUrl/restaurants/swipe'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Erreur API : ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Erreur réseau : $e');
  }
}
