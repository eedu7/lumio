import 'dart:convert';

import 'package:frontend/core/constants/api_constants.dart';
import 'package:frontend/core/network/api_client.dart';
import 'package:frontend/features/categories/model/app_category_model.dart';

class CategoryService {
  // Get all categories
  static Future<List<AppCategoryModel>> getCategories() async {
    final response = await ApiClient.get(baseCategoryAPIUrl);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch categories');
    }

    final List data = jsonDecode(response.body);
    return data.map((e) => AppCategoryModel.fromJson(e)).toList();
  }
}
