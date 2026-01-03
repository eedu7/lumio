import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/cart/provider/cart_provider.dart';
import 'package:frontend/features/checkout/presentations/widgets/checout_item_card.dart';
import 'package:frontend/features/checkout/presentations/widgets/place_order_button.dart';
import 'package:frontend/features/shipping-address/presentations/widgets/shipping_address_card.dart';
import 'package:frontend/features/shipping-address/provider/address_provider.dart'; // Import this
import 'package:go_router/go_router.dart';

class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cartAsync = ref.watch(cartProvider);
    final addressAsync = ref.watch(addressProvider);

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
        error: (err, stack) => Center(child: Text('Error loading cart: $err')),
        data: (cart) {
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
                      Text(
                        'Shipping Address',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      addressAsync.when(
                        loading: () => const LinearProgressIndicator(),
                        error: (err, _) => Text('Could not load address: $err'),
                        data: (addresses) {
                          final defaultAddress = addresses.firstWhere(
                            (a) => a.isDefault,
                            orElse: () => addresses.isNotEmpty
                                ? addresses.first
                                : throw Exception('No address found'),
                          );

                          if (addresses.isEmpty) {
                            return ShippingAddressCard(
                              title: 'No Address Found',
                              address:
                                  'Please add a shipping address to continue',
                              onTap: () =>
                                  context.push(AppRoutes.shippingAddress),
                              trailingIcon: Icons.add_circle_outline,
                            );
                          }

                          return ShippingAddressCard(
                            title: defaultAddress.addressType,
                            address:
                                '${defaultAddress.addressLine}, ${defaultAddress.city}',
                            isDefault: defaultAddress.isDefault,
                            onTap: () =>
                                context.push(AppRoutes.shippingAddress),
                          );
                        },
                      ),

                      Text(
                        'Order Summary',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cart.items.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) =>
                            CheckoutItemCard(item: cart.items[index]),
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom Section
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
