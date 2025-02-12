import 'package:ceticy/core/app_constants.dart';
import 'package:ceticy/models/api_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PollService {
  static Future<List> fetchAllPolls(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$apiBaseUrl/polls'),
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

      return jsonDecode(response.body);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      } else {
        throw Exception("Erreur réseau ou autre: $e");
      }
    }
  }

  static Future<String> createPoll(String token, String name) async {
    try {
      final body = jsonEncode({"name": name});

      final response = await http.post(
        Uri.parse('$apiBaseUrl/polls'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode >= 400) {
        final errorResponse = jsonDecode(response.body);
        throw ApiException(
          kind: errorResponse['kind'] ?? 'unknown',
          content: errorResponse['content'] ?? 'unknown error',
        );
      }

      return response.body;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      } else {
        throw Exception("Erreur réseau ou autre: $e");
      }
    }
  }

  static Future<String> deletePoll(String token, int pollId) async {
    try {
      final body = jsonEncode({"pollId": pollId});

      final response = await http.delete(
        Uri.parse('$apiBaseUrl/polls'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode >= 400) {
        final errorResponse = jsonDecode(response.body);
        throw ApiException(
          kind: errorResponse['kind'] ?? 'unknown',
          content: errorResponse['content'] ?? 'unknown error',
        );
      }

      return response.body;
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      } else {
        throw Exception("Erreur réseau ou autre: $e");
      }
    }
  }
}
