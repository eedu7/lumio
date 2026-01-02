import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/cart/provider/cart_provider.dart';
import 'package:go_router/go_router.dart';

class ProductPriceBar extends ConsumerWidget {
  final String label;
  final double price;
  final String buttonLabel;
  final IconData icon;
  final String productId;
  final int quantity;

  const ProductPriceBar({
    super.key,
    required this.productId,
    this.quantity = 1,
    this.label = 'Total price',
    required this.price,
    this.buttonLabel = 'Add to Cart',
    this.icon = Icons.shopping_bag_outlined,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Price Section
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '\$ $price',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: SizedBox(
              height: 56,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () async {
                  try {
                    await addItemToCart(
                      ref,
                      productId: productId,
                      quantity: quantity,
                    );

                    // 3. Navigate to cart
                    if (context.mounted) {
                      context.go(AppRoutes.cart);
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error updating cart: $e')),
                    );
                  }
                },
                icon: Icon(icon, size: 20),
                label: Text(
                  buttonLabel,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
