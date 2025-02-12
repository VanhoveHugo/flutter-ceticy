import 'package:ceticy/core/app_constants.dart';
import 'package:ceticy/models/api_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FriendService {
  static Future<List> fetchAllPolls(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$apiBaseUrl/friends'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode >= 400) {
        final errorResponse = jsonDecode(response.body);
        throw ApiException(
          kind: errorResponse['kind'] ?? 'unknown',
          content: errorResponse['content'] ?? 'unknown error',
        );
      }

      print(jsonDecode(response.body));

      return jsonDecode(response.body);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      } else {
        throw Exception("Erreur réseau ou autre: $e");
      }
    }
  }
}
