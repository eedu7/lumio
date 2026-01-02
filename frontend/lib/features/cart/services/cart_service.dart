import 'dart:convert';

import 'package:frontend/core/network/api_client.dart';
import 'package:frontend/features/cart/model/cart_item_model.dart';
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

  static Future<CartItemModel> addCartItem({
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

    final data = jsonDecode(response.body);
    return CartItemModel.fromJson(data);
  }
}
