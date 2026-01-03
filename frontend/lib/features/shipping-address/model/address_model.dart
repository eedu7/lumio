class AddressModel {
  final String id;
  final String fullName;
  final String phone;
  final String addressLine;
  final String city;
  final String? state;
  final String addressType;
  final bool isDefault;

  AddressModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.addressLine,
    required this.city,
    this.state,
    required this.addressType,
    required this.isDefault,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      fullName: json['full_name'],
      phone: json['phone'],
      addressLine: json['address_line'],
      city: json['city'],
      state: json['state'],
      addressType: json['address_type'],
      isDefault: json['is_default'],
    );
  }
}
