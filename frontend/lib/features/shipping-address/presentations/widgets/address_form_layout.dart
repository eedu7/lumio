import 'package:flutter/material.dart';
import 'package:frontend/features/shipping-address/presentations/widgets/address_form_field.dart';

class AddressFormLayout extends StatelessWidget {
  final String appBarTitle;
  final String buttonLabel;
  final VoidCallback onSave;
  final bool isLoading;

  final TextEditingController addressTypeController;
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController addressLineController;
  final TextEditingController cityController;
  final TextEditingController stateController;

  final bool isDefault;
  final ValueChanged<bool> onDefaultChanged;

  const AddressFormLayout({
    super.key,
    required this.appBarTitle,
    required this.buttonLabel,
    required this.onSave,
    required this.addressTypeController,
    required this.fullNameController,
    required this.phoneController,
    required this.addressLineController,
    required this.cityController,
    required this.stateController,
    required this.isDefault,
    required this.onDefaultChanged,
    this.isLoading = false,
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
                  AddressFormField(
                    label: 'Address Name (e.g., Home, Office)',
                    hintText: 'Home',
                    controller: addressTypeController,
                    enabled: !isLoading,
                  ),
                  AddressFormField(
                    label: 'Full Name',
                    hintText: 'Enter your full name',
                    controller: fullNameController,
                    enabled: !isLoading,
                  ),
                  AddressFormField(
                    label: 'Phone Number',
                    hintText: '0300xxxxxxx',
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    enabled: !isLoading,
                  ),
                  AddressFormField(
                    label: 'Street Address',
                    hintText: 'Street, Area',
                    maxLines: 2,
                    controller: addressLineController,
                    enabled: !isLoading,
                  ),
                  Row(
                    spacing: 16.0,
                    children: [
                      Expanded(
                        child: AddressFormField(
                          label: 'City',
                          hintText: 'Lahore',
                          controller: cityController,
                          enabled: !isLoading,
                        ),
                      ),
                      Expanded(
                        child: AddressFormField(
                          label: 'State',
                          hintText: 'Punjab',
                          controller: stateController,
                          enabled: !isLoading,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Set as default address',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Switch.adaptive(
                        value: isDefault,
                        onChanged: isLoading ? null : onDefaultChanged,
                        activeThumbColor: theme.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
                onPressed: isLoading ? null : onSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: theme.primaryColor.withValues(
                    alpha: 0.6,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : Text(
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
