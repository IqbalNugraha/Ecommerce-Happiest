import 'dart:convert';

class UserAddressRequestModel {
  final ModelUserAddress data;
  UserAddressRequestModel({
    required this.data,
  });

  UserAddressRequestModel copyWith({
    ModelUserAddress? data,
  }) {
    return UserAddressRequestModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
    };
  }

  factory UserAddressRequestModel.fromMap(Map<String, dynamic> map) {
    return UserAddressRequestModel(
      data: ModelUserAddress.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddressRequestModel.fromJson(String source) =>
      UserAddressRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class ModelUserAddress {
  final String namaReceiver;
  final String phoneNumber;
  final String address;
  final String province;
  final String city;
  final String subdistrict;
  final String postalCode;
  final bool isDefault;
  ModelUserAddress({
    required this.namaReceiver,
    required this.phoneNumber,
    required this.address,
    required this.province,
    required this.city,
    required this.subdistrict,
    required this.postalCode,
    required this.isDefault,
  });

  ModelUserAddress copyWith({
    String? namaReceiver,
    String? phoneNumber,
    String? address,
    String? province,
    String? city,
    String? subdistrict,
    String? postalCode,
    bool? isDefault,
  }) {
    return ModelUserAddress(
      namaReceiver: namaReceiver ?? this.namaReceiver,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      province: province ?? this.province,
      city: city ?? this.city,
      subdistrict: subdistrict ?? this.subdistrict,
      postalCode: postalCode ?? this.postalCode,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama_receiver': namaReceiver,
      'phone_number': phoneNumber,
      'address': address,
      'province': province,
      'city': city,
      'subdistrict': subdistrict,
      'postal_code': postalCode,
      'is_default': isDefault,
    };
  }

  factory ModelUserAddress.fromMap(Map<String, dynamic> map) {
    return ModelUserAddress(
      namaReceiver: map['nama_receiver'] as String,
      phoneNumber: map['phone_number'] as String,
      address: map['address'] as String,
      province: map['province'] as String,
      city: map['city'] as String,
      subdistrict: map['subdistrict'] as String,
      postalCode: map['postal_code'] as String,
      isDefault: map['is_default'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelUserAddress.fromJson(String source) =>
      ModelUserAddress.fromMap(json.decode(source) as Map<String, dynamic>);
}
