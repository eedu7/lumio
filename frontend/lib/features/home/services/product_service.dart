import 'dart:convert';

import 'package:frontend/core/constants/api_constants.dart';
import 'package:frontend/core/network/api_client.dart';
import 'package:frontend/features/home/model/product_model.dart';

class ProductService {
  static Future<List<ProductModel>> getProducts({
    int skip = 0,
    int limit = 20,
  }) async {
    final response = await ApiClient.get(
      baseProductAPIUrl,
      query: {'skip': skip.toString(), 'limit': limit.toString()},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch products');
    }
    final List data = jsonDecode(response.body);
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  static Future<List<ProductModel>> getProductsByCategoryId({
    int skip = 0,
    int limit = 20,
    required String categoryId,
  }) async {
    final response = await ApiClient.get(
      baseProductByCategory,
      query: {
        'skip': skip.toString(),
        'limit': limit.toString(),
        'category_id': categoryId,
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch products');
    }
    final List data = jsonDecode(response.body);
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  static Future<ProductModel> getProductById({required String id}) async {
    final response = await ApiClient.get('$baseProductByCategory/$id');
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch products');
    }
    final data = jsonDecode(response.body);
    return ProductModel.fromJson(data);
  }
}
