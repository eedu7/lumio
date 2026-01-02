import 'dart:convert';

import 'package:frontend/core/network/api_client.dart';
import 'package:frontend/features/cart/model/cart_model.dart';

class CartService {
  static Future<CartModel> getUserCart() async {
    final response = await ApiClient.get('/cart/');
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch cart');
    }
    final data = jsonDecode(response.body);
    return CartModel.fromJson(data);
  }

  static Future<void> addCartItem({
    required String productId,
    int quantity = 1,
  }) async {
    final response = await ApiClient.post(
      '/cart-item/',
      body: {'product_id': productId, 'quantity': quantity},
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add cart item');
    }
  }

  static Future<void> removeCart() async {
    final response = await ApiClient.put('/cart/deactivate');

    if (response.statusCode != 200) {
      throw Exception('Failed to place order ');
    }
  }
}
