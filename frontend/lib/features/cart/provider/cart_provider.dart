import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/cart/model/cart_item_model.dart';
import 'package:frontend/features/cart/model/cart_model.dart';
import 'package:frontend/features/cart/services/cart_service.dart';

final cartProvider = FutureProvider<CartModel>((ref) async {
  return CartService.getUserCart();
});

Future<CartItemModel> addItemToCart(
  WidgetRef ref, {
  required String productId,
  int quantity = 1,
}) async {
  final newItem = await CartService.addCartItem(
    productId: productId,
    quantity: quantity,
  );

  // Revalidate the cart provider
  ref.invalidate(cartProvider);

  return newItem;
}
