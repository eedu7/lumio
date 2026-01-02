import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/cart/provider/cart_provider.dart';
import 'package:frontend/features/checkout/presentations/widgets/checout_item_card.dart';
import 'package:frontend/features/checkout/presentations/widgets/place_order_button.dart';
import 'package:frontend/features/shipping-address/presentations/widgets/shipping_address_card.dart';
import 'package:go_router/go_router.dart';

class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Added WidgetRef
    final theme = Theme.of(context);
    final cartAsync = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: cartAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (cart) {
          // Calculate total amount dynamically
          final double totalAmount = cart.items.fold(
            0,
            (sum, item) => sum + (item.product.price * item.quantity),
          );

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20.0,
                    children: [
                      // Shipping Address
                      Text(
                        'Shipping Address',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ShippingAddressCard(
                        title: 'Home',
                        address: '123 Dummy Street, New York, NY 10001',
                        isDefault: true,
                        trailingIcon: Icons.chevron_right_rounded,
                        onTap: () => context.push(AppRoutes.shippingAddress),
                      ),

                      // Order Summary
                      Text(
                        'Order Summary',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // Render actual cart items
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cart.items.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return CheckoutItemCard(item: cart.items[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Amount & Button Section
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16.0,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          '\$${totalAmount.toStringAsFixed(2)}',
                          // Dynamic Price
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    PlaceOrderButton(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
