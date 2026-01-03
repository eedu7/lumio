import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/shipping-address/presentations/widgets/base_address_layout.dart';
import 'package:frontend/features/shipping-address/presentations/widgets/selectable_address_card.dart';
import 'package:frontend/features/shipping-address/provider/address_provider.dart';
import 'package:go_router/go_router.dart';

class ShippingAddressPage extends ConsumerStatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  ConsumerState<ShippingAddressPage> createState() =>
      _ShippingAddressPageState();
}

class _ShippingAddressPageState extends ConsumerState<ShippingAddressPage> {
  String? _selectedAddressId;

  @override
  Widget build(BuildContext context) {
    final addressesAsync = ref.watch(addressProvider);
    final theme = Theme.of(context);

    return addressesAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (err, stack) => Scaffold(
        appBar: AppBar(title: const Text('Shipping Address')),
        body: Center(child: Text('Error: $err')),
      ),
      data: (addresses) {
        // --- NEW LOGIC FOR EMPTY STATE ---
        if (addresses.isEmpty) {
          return Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              title: const Text(
                'Shipping Address',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.location_off_rounded,
                        size: 64,
                        color: theme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'No Addresses Saved',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'You haven\'t added any shipping addresses yet. Add one to make checkout faster!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600], height: 1.5),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () =>
                            context.push(AppRoutes.addShippingAddress),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Add New Address',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return BaseAddressLayout(
          appBarTitle: 'Shipping Address',
          buttonLabel: 'Add New Address',
          onButtonPressed: () => context.push(AppRoutes.addShippingAddress),
          itemCount: addresses.length,
          itemBuilder: (context, index) {
            final address = addresses[index];
            return SelectableAddressCard(
              title: address.addressType,
              address: '${address.addressLine}, ${address.city}',
              isSelected:
                  _selectedAddressId == address.id ||
                  (address.isDefault && _selectedAddressId == null),
              isDefault: address.isDefault,
              onSelect: () => setState(() => _selectedAddressId = address.id),
              onEdit: () =>
                  context.push(AppRoutes.editShippingAddress, extra: address),
            );
          },
        );
      },
    );
  }
}
