import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/shipping-address/model/address_model.dart';
import 'package:frontend/features/shipping-address/presentations/widgets/address_form_layout.dart';
import 'package:frontend/features/shipping-address/provider/address_provider.dart';

class EditShippingAddressPage extends ConsumerStatefulWidget {
  final AddressModel address;

  const EditShippingAddressPage({super.key, required this.address});

  @override
  ConsumerState<EditShippingAddressPage> createState() =>
      _EditShippingAddressPageState();
}

class _EditShippingAddressPageState
    extends ConsumerState<EditShippingAddressPage> {
  late final TextEditingController _addressTypeController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressLineController;
  late final TextEditingController _cityController;
  late final TextEditingController _stateController;

  bool _isDefault = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addressTypeController = TextEditingController(
      text: widget.address.addressType,
    );
    _fullNameController = TextEditingController(text: widget.address.fullName);
    _phoneController = TextEditingController(text: widget.address.phone);
    _addressLineController = TextEditingController(
      text: widget.address.addressLine,
    );
    _cityController = TextEditingController(text: widget.address.city);
    _stateController = TextEditingController(text: widget.address.state);
    _isDefault = widget.address.isDefault;
  }

  Future<void> _onSave() async {
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

      await updateAddress(ref, addressId: widget.address.id, payload: payload);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Address updated!')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Update failed: $e')));
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
      appBarTitle: 'Edit Address',
      buttonLabel: 'Update Address',
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
