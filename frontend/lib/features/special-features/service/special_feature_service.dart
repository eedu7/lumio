import 'dart:convert';
import 'dart:io';

import 'package:frontend/core/network/api_client.dart';

class SpecialFeatureService {
  static Future<Map<String, dynamic>?> analyzeSkin(File imageFile) async {
    try {
      final response = await ApiClient.uploadImage('/ai/', imageFile);

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        final Map<String, dynamic> data = jsonDecode(respStr);

        if (data['result'] != null && data['result'].isNotEmpty) {
          final topMatch = data['result'][0];
          final String ageLabel = topMatch['label'];
          final double confidence = topMatch['score'] * 100;
          return {
            "age_group": "$ageLabel Years",
            "score": "${confidence.toStringAsFixed(0)}%",
            "recommendations": _getDummyProducts(ageLabel),
          };
        }
      } else {
        print("Server Error: ${response.statusCode}");
      }
      return null;
    } catch (e) {
      print("Analysis Error (Timeout or Network): $e");
      return null;
    }
  }

  static List<Map<String, dynamic>> _getDummyProducts(String ageLabel) {
    return [
      {"name": "Age-Specific Cleanser", "price": 15.99, "tag": "Essential"},
      {"name": "Restorative Treatment", "price": 34.50, "tag": "Top Pick"},
      {"name": "UV Shield Pro", "price": 22.00, "tag": "Daily Care"},
    ];
  }
}
