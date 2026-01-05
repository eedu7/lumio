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

        return {
          "age_group": "${data['age_bracket']} Years",
          "score": "${((data['score'] ?? 0) * 100).toStringAsFixed(0)}%",
          "recommendations": data['products'] ?? [],
        };
      } else {
        print("Server Error: ${response.statusCode}");
      }
      return null;
    } catch (e) {
      print("Analysis Error: $e");
      return null;
    }
  }
}
