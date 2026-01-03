import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/shipping-address/presentations/widgets/address_form_layout.dart';
import 'package:frontend/features/shipping-address/provider/address_provider.dart';

class AddShippingAddressPage extends ConsumerStatefulWidget {
  const AddShippingAddressPage({super.key});

  @override
  ConsumerState<AddShippingAddressPage> createState() =>
      _AddShippingAddressPageState();
}

class _AddShippingAddressPageState
    extends ConsumerState<AddShippingAddressPage> {
  final _addressTypeController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressLineController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();

  bool _isDefault = false;
  bool _isLoading = false;

  Future<void> _onSave() async {
    if (_fullNameController.text.isEmpty) return;

    setState(() => _isLoading = true);
    try {
      final payload = {
        "full_name": _fullNameController.text.trim(),
        "phone": _phoneController.text.trim(),
        "address_line": _addressLineController.text.trim(),
        "city": _cityController.text.trim(),
        "state": _stateController.text.trim().isEmpty
            ? null
            : _stateController.text.trim(),
        "address_type": _addressTypeController.text.trim(),
        "is_default": _isDefault,
      };

      await createAddress(ref, payload: payload);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('New address added!')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _addressTypeController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _addressLineController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AddressFormLayout(
      appBarTitle: 'Add New Address',
      buttonLabel: 'Save Address',
      isLoading: _isLoading,
      addressTypeController: _addressTypeController,
      fullNameController: _fullNameController,
      phoneController: _phoneController,
      addressLineController: _addressLineController,
      cityController: _cityController,
      stateController: _stateController,
      isDefault: _isDefault,
      onDefaultChanged: (val) => setState(() => _isDefault = val),
      onSave: _onSave,
    );
  }
}
