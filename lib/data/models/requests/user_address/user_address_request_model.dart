import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserAddressRequestModel {
  final Data data;
  UserAddressRequestModel({
    required this.data,
  });

  UserAddressRequestModel copyWith({
    Data? data,
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
      data: Data.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAddressRequestModel.fromJson(String source) =>
      UserAddressRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserAddressRequestModel(data: $data)';

  @override
  bool operator ==(covariant UserAddressRequestModel other) {
    if (identical(this, other)) return true;

    return other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class Data {
  final String namaReceiver;
  final String phoneNumber;
  final String address;
  final String province;
  final String city;
  final String subdistrict;
  final String postalCode;
  final String idSubdistrict;
  final bool isDefault;
  final List<int> user;
  Data({
    required this.namaReceiver,
    required this.phoneNumber,
    required this.address,
    required this.province,
    required this.city,
    required this.subdistrict,
    required this.postalCode,
    required this.idSubdistrict,
    required this.isDefault,
    required this.user,
  });

  Data copyWith({
    String? namaReceiver,
    String? phoneNumber,
    String? address,
    String? province,
    String? city,
    String? subdistrict,
    String? postalCode,
    String? idSubdistrict,
    bool? isDefault,
    List<int>? user,
  }) {
    return Data(
      namaReceiver: namaReceiver ?? this.namaReceiver,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      province: province ?? this.province,
      city: city ?? this.city,
      subdistrict: subdistrict ?? this.subdistrict,
      postalCode: postalCode ?? this.postalCode,
      idSubdistrict: idSubdistrict ?? this.idSubdistrict,
      isDefault: isDefault ?? this.isDefault,
      user: user ?? this.user,
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
      'id_subdistrict': idSubdistrict,
      'is_default': isDefault,
      'user': user,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      namaReceiver: map['nama_receiver'] as String,
      phoneNumber: map['phone_number'] as String,
      address: map['address'] as String,
      province: map['province'] as String,
      city: map['city'] as String,
      subdistrict: map['subdistrict'] as String,
      postalCode: map['postal_code'] as String,
      idSubdistrict: map['is_default'] as String,
      isDefault: map['is_default'] as bool,
      user: List<int>.from(
        (map['user'] as List<int>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(nama_receiver: $namaReceiver, phone_number: $phoneNumber, address: $address, province: $province, city: $city, subdistrict: $subdistrict, postal_code: $postalCode, is_default: $isDefault, user: $user)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.namaReceiver == namaReceiver &&
        other.phoneNumber == phoneNumber &&
        other.address == address &&
        other.province == province &&
        other.city == city &&
        other.subdistrict == subdistrict &&
        other.postalCode == postalCode &&
        other.isDefault == isDefault &&
        listEquals(other.user, user);
  }

  @override
  int get hashCode {
    return namaReceiver.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode ^
        province.hashCode ^
        city.hashCode ^
        subdistrict.hashCode ^
        postalCode.hashCode ^
        isDefault.hashCode ^
        user.hashCode;
  }
}
