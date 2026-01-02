import 'dart:convert';

import 'package:frontend/core/config/env.dart';
import 'package:frontend/core/services/supabase/supabase_service.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient._(); // private constructor

  static Uri _buildUri(String apiUrl, [Map<String, String>? query]) {
    return Uri.parse(
      '${ENV.BASE_API_URL}$apiUrl',
    ).replace(queryParameters: query);
  }

  static Map<String, String> _headers() {
    final session = SupabaseService.client.auth.currentSession;

    if (session == null) {
      throw Exception('User is not authenticated');
    }

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${session.accessToken}',
    };
  }

  // Get
  static Future<http.Response> get(
    String apiUrl, {
    Map<String, String>? query,
  }) {
    return http.get(_buildUri(apiUrl, query), headers: _headers());
  }

  // Post
  static Future<http.Response> post(
    String apiUrl, {
    Map<String, dynamic>? body,
  }) {
    return http.post(
      _buildUri(apiUrl),
      headers: _headers(),
      body: jsonEncode(body),
    );
  }

  // Put
  static Future<http.Response> put(
    String apiUrl, {
    Map<String, dynamic>? body,
  }) {
    return http.put(
      _buildUri(apiUrl),
      headers: _headers(),
      body: jsonEncode(body),
    );
  }

  // Delete
  static Future<http.Response> delete(String apiUrl) {
    return http.delete(_buildUri(apiUrl), headers: _headers());
  }
}
