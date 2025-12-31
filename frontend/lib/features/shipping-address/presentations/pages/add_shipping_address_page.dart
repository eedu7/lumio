import 'package:flutter/material.dart';
import 'package:frontend/features/shipping-address/presentations/widgets/address_form_layout.dart';

class AddShippingAddressPage extends StatelessWidget {
  const AddShippingAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AddressFormLayout(
      appBarTitle: 'Add New Address',
      buttonLabel: 'Save Address',
      onSave: () {
        // TODO: Implement save logic
      },
    );
  }
}
