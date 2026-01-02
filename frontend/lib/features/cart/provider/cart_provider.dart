import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/cart/model/cart_model.dart';
import 'package:frontend/features/cart/services/cart_service.dart';

final cartProvider = FutureProvider<CartModel>((ref) async {
  return CartService.getUserCart();
});

Future<void> addItemToCart(
  WidgetRef ref, {
  required String productId,
  int quantity = 1,
}) async {
  await CartService.addCartItem(productId: productId, quantity: quantity);
  ref.invalidate(cartProvider);
}

Future<void> removeCart(WidgetRef ref) async {
  await CartService.removeCart();
  ref.invalidate(cartProvider);
}
