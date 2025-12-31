import 'package:flutter/material.dart';
import 'package:frontend/features/shipping-address/presentations/widgets/address_form_field.dart';

class AddressFormLayout extends StatelessWidget {
  final String appBarTitle;
  final String buttonLabel;
  final VoidCallback onSave;

  const AddressFormLayout({
    super.key,
    required this.appBarTitle,
    required this.buttonLabel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 20.0,
                children: [
                  const AddressFormField(
                    label: 'Address Name (e.g., Home, Office)',
                    hintText: 'Enter address name',
                  ),
                  const AddressFormField(
                    label: 'Full Name',
                    hintText: 'Enter your full name',
                  ),
                  const AddressFormField(
                    label: 'Phone Number',
                    hintText: 'Enter phone number',
                    keyboardType: TextInputType.phone,
                  ),
                  const AddressFormField(
                    label: 'Street Address',
                    hintText: 'Enter street address',
                    maxLines: 2,
                  ),
                  const Row(
                    spacing: 16.0,
                    children: [
                      Expanded(
                        child: AddressFormField(
                          label: 'City',
                          hintText: 'New York',
                        ),
                      ),
                      Expanded(
                        child: AddressFormField(
                          label: 'Zip Code',
                          hintText: '10001',
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  // Default Address Toggle
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Set as default address',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Switch.adaptive(
                        value: true,
                        onChanged: (val) {},
                        activeThumbColor: theme.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Sticky Bottom Button
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
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: onSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  buttonLabel,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
