import 'package:ceticy/core/app_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const _storage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'jwt', value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: 'jwt');
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: 'jwt');
  }

  static Future<String> register(
      String email, String password, String username, String scope) async {
    final response = await http.post(
      Uri.parse('$apiBaseUrl/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
        'name': username,
        'scope': scope,
      }),
    );

    return response.body;
  }

  static Future<String?> login(
      String email, String password, String scope) async {
    final response = await http.post(
      Uri.parse('$apiBaseUrl/auth/signin'),
      body: {
        'email': email,
        'password': password,
        'scope': scope,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await saveToken(data['token']);
      return data['token'];
    } else {
      throw Exception(response.body);
    }
  }

  static Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null;
  }

  static Future<Map<String, dynamic>?> getAccountInfo() async {
    try {
      final token = await getToken();
      if (token == null) {
        return null;
      }

      final response = await http.get(
        Uri.parse('$apiBaseUrl/auth/account'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Échec de la récupération des informations du compte');
      }
    } catch (e) {
      throw Exception(
          'Erreur lors de la récupération des informations du compte: $e');
    }
  }
}
