import 'dart:convert';

class EditUserAddressRequestModel {
  final ModelEditUserAddress data;
  EditUserAddressRequestModel({
    required this.data,
  });

  EditUserAddressRequestModel copyWith({
    ModelEditUserAddress? data,
  }) {
    return EditUserAddressRequestModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
    };
  }

  factory EditUserAddressRequestModel.fromMap(Map<String, dynamic> map) {
    return EditUserAddressRequestModel(
      data: ModelEditUserAddress.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory EditUserAddressRequestModel.fromJson(String source) =>
      EditUserAddressRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);  
}

class ModelEditUserAddress {
  final int id;
  final String namaReceiver;
  final String phoneNumber;
  final String address;
  final String province;
  final String city;
  final String subdistrict;
  final String postalCode;
  final String idSubdistrict;
  final bool isDefault;
  ModelEditUserAddress({
    required this.id,
    required this.namaReceiver,
    required this.phoneNumber,
    required this.address,
    required this.province,
    required this.city,
    required this.subdistrict,
    required this.postalCode,
    required this.idSubdistrict,
    required this.isDefault,
  });

  ModelEditUserAddress copyWith({
    int? id,
    String? namaReceiver,
    String? phoneNumber,
    String? address,
    String? province,
    String? city,
    String? subdistrict,
    String? postalCode,
    String? idSubdistrict,
    bool? isDefault,
  }) {
    return ModelEditUserAddress(
      id: id ?? this.id,
      namaReceiver: namaReceiver ?? this.namaReceiver,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      province: province ?? this.province,
      city: city ?? this.city,
      subdistrict: subdistrict ?? this.subdistrict,
      postalCode: postalCode ?? this.postalCode,
      idSubdistrict: idSubdistrict ?? this.idSubdistrict,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama_receiver': namaReceiver,
      'phone_number': phoneNumber,
      'address': address,
      'province': province,
      'city': city,
      'subdistrict': subdistrict,
      'postal_code': postalCode,
      'id_subdistrict': idSubdistrict,
      'is_default': isDefault,
    };
  }

  factory ModelEditUserAddress.fromMap(Map<String, dynamic> map) {
    return ModelEditUserAddress(
      id: map['id'].toInt() as int,
      namaReceiver: map['nama_receiver'] as String,
      phoneNumber: map['phone_number'] as String,
      address: map['address'] as String,
      province: map['province'] as String,
      city: map['city'] as String,
      subdistrict: map['subdistrict'] as String,
      postalCode: map['postal_code'] as String,
      idSubdistrict: map['is_default'] as String,
      isDefault: map['is_default'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelEditUserAddress.fromJson(String source) =>
      ModelEditUserAddress.fromMap(json.decode(source) as Map<String, dynamic>);
}
