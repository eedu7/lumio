import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/cart/provider/cart_provider.dart';
import 'package:frontend/features/cart/services/cart_service.dart';
import 'package:go_router/go_router.dart';

class PlaceOrderButton extends ConsumerWidget {
  const PlaceOrderButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () async {
          try {
            await CartService.removeCart();

            ref.invalidate(cartProvider);

            context.go(AppRoutes.congratulations);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to place order: $e')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Place Order',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
