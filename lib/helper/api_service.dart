import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Method to handle GET requests
  Future<dynamic> get({required String url}) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Method to handle POST requests
  Future<dynamic> post({
    required String url,
    required dynamic body,
  }) async {
    try {
      final response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Method to handle PUT requests
  Future<dynamic> put({
    required String url,
    required dynamic body,
  }) async {
    try {
      final response = await http.put(Uri.parse(url), body: body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
