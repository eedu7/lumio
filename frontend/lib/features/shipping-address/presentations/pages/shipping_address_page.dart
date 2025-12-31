import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/shipping-address/presentations/widgets/base_address_layout.dart';
import 'package:frontend/features/shipping-address/presentations/widgets/selectable_address_card.dart';
import 'package:go_router/go_router.dart';

class ShippingAddressPage extends StatefulWidget {
  const ShippingAddressPage({super.key});

  @override
  State<ShippingAddressPage> createState() => _ShippingAddressPageState();
}

class _ShippingAddressPageState extends State<ShippingAddressPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseAddressLayout(
      appBarTitle: 'Shipping Address',
      buttonLabel: 'Add New Address',
      onButtonPressed: () => context.push(AppRoutes.addShippingAddress),
      itemCount: 3,
      itemBuilder: (context, index) {
        return SelectableAddressCard(
          title: index == 0 ? 'Home' : 'Office $index',
          address: '123 Dummy Street, New York, NY 10001',
          isSelected: _selectedIndex == index,
          isDefault: index == 0,
          onSelect: () => setState(() => _selectedIndex = index),
          onEdit: () => context.push(AppRoutes.editShippingAddress),
        );
      },
    );
  }
}
