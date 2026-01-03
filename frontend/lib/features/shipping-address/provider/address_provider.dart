import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/shipping-address/model/address_model.dart';
import 'package:frontend/features/shipping-address/services/address_service.dart';

final addressProvider = FutureProvider<List<AddressModel>>((ref) async {
  return AddressService.getUserAddresses();
});

Future<void> createAddress(
  WidgetRef ref, {
  required Map<String, dynamic> payload,
}) async {
  await AddressService.createAddress(payload);
  ref.invalidate(addressProvider);
}

Future<void> updateAddress(
  WidgetRef ref, {
  required String addressId,
  required Map<String, dynamic> payload,
}) async {
  await AddressService.updateAddress(addressId, payload);
  ref.invalidate(addressProvider);
}

Future<void> deleteAddress(WidgetRef ref, {required String addressId}) async {
  await AddressService.deleteAddress(addressId);
  ref.invalidate(addressProvider);
}
