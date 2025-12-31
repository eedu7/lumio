import 'package:flutter/material.dart';
import 'package:frontend/features/shipping-address/presentations/widgets/address_form_layout.dart';

class EditShippingAddressPage extends StatelessWidget {
  const EditShippingAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AddressFormLayout(
      appBarTitle: 'Edit Address',
      buttonLabel: 'Update Address',
      onSave: () {
        // TODO: Implement update logic
      },
    );
  }
}
