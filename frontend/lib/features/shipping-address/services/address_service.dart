import 'dart:convert';

import 'package:frontend/core/network/api_client.dart';
import 'package:frontend/features/shipping-address/model/address_model.dart';

class AddressService {
  static Future<List<AddressModel>> getUserAddresses() async {
    final response = await ApiClient.get('/address/');

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch addresses');
    }

    final List data = jsonDecode(response.body);
    return data.map((e) => AddressModel.fromJson(e)).toList();
  }

  static Future<AddressModel> getAddressById(String id) async {
    final response = await ApiClient.get('/address/$id');

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch address');
    }

    return AddressModel.fromJson(jsonDecode(response.body));
  }

  static Future<void> createAddress(Map<String, dynamic> body) async {
    final response = await ApiClient.post('/address/', body: body);

    if (response.statusCode != 201) {
      throw Exception('Failed to create address');
    }
  }

  static Future<void> updateAddress(
    String id,
    Map<String, dynamic> body,
  ) async {
    final response = await ApiClient.put('/address/$id', body: body);

    if (response.statusCode != 200) {
      throw Exception('Failed to update address');
    }
  }

  static Future<void> deleteAddress(String id) async {
    final response = await ApiClient.delete('/address/$id');

    if (response.statusCode != 204) {
      throw Exception('Failed to delete address');
    }
  }
}
