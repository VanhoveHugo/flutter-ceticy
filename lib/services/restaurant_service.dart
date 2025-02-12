import 'dart:convert';
import 'dart:io';
import 'package:ceticy/core/app_constants.dart';
import 'package:ceticy/models/api_exception.dart';
import 'package:ceticy/models/restaurant_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class RestaurantService {
  static Future<List<Restaurant>> fetchRestaurants(String token) async {
    final response =
        await http.get(Uri.parse('$apiBaseUrl/restaurants/list'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((json) => Restaurant.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  static Future<List<Restaurant>> fetchLikeRestaurants(String token) async {
    final response =
        await http.get(Uri.parse('$apiBaseUrl/restaurants/like'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((json) => Restaurant.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  static Future<String> createRestaurant(
      String token,
      String name,
      String description,
      int averagePrice,
      int averageService,
      String phoneNumber,
      File thumbnail) async {
    try {
      var uri = Uri.parse('$apiBaseUrl/restaurants');
      var request = http.MultipartRequest('POST', uri)
        ..headers['Authorization'] = 'Bearer $token';

      request.files.add(await http.MultipartFile.fromPath(
        'thumbnail',
        thumbnail.path,
        contentType: MediaType('image', 'jpeg'),
      ));

      request.fields['name'] = name;
      request.fields['description'] = description;
      request.fields['averagePrice'] = averagePrice.toString();
      request.fields['averageService'] = averageService.toString();
      request.fields['phoneNumber'] = phoneNumber;

      var response = await request.send();

      if (response.statusCode >= 400) {
        var errorResponse = await response.stream.bytesToString();
        var errorData = jsonDecode(errorResponse);
        throw ApiException(
          kind: errorData['kind'] ?? 'unknown',
          content: errorData['content'] ?? 'unknown error',
        );
      }
      return response.reasonPhrase ?? 'unknown';
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      } else {
        throw Exception("Erreur réseau ou autre: $e");
      }
    }
  }

  static Future<List<Restaurant>> fetchManagerRestaurants(String token) async {
    final response =
        await http.get(Uri.parse('$apiBaseUrl/restaurants/'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((json) => Restaurant.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load restaurants');
    }
  }
}
