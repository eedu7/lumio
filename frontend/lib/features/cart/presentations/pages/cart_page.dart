import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/cart/presentations/widgets/cart_item.dart';
import 'package:frontend/features/cart/presentations/widgets/checkout_button.dart';
import 'package:frontend/features/cart/provider/cart_provider.dart';
import 'package:go_router/go_router.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsync = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leadingWidth: 72,
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.black87,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: cartAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, __) => const Center(child: Text('Failed to load cart')),
          data: (cart) {
            if (cart.items.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 80,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Your cart is empty',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () => context.go(AppRoutes.home),
                      // Or your shop route
                      child: const Text('Go Shopping'),
                    ),
                  ],
                ),
              );
            }
            final String totalPriceString = cart.items
                .fold(
                  0.0,
                  (previousValue, element) =>
                      previousValue +
                      (element.product.price * element.quantity),
                )
                .toStringAsFixed(3);
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return CartItem(
                        item: item,
                        onIncrement: () {
                          // TODO: ref.read(cartProvider.notifier).updateQuantity(item.id, item.quantity + 1);
                        },
                        onDecrement: () {
                          if (item.quantity > 1) {
                            // TODO: ref.read(cartProvider.notifier).updateQuantity(item.id, item.quantity - 1);
                          }
                        },
                        onDelete: () {
                          // TODO: ref.read(cartProvider.notifier).removeItem(item.id);
                        },
                      );
                    },
                  ),
                ),
                CheckoutButton(
                  price: totalPriceString,
                  buttonLabel: 'Checkout',
                  icon: Icons.arrow_forward_rounded,
                  onPressed: () => context.push(AppRoutes.checkout),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
