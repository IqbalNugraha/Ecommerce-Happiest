import 'dart:convert';

class UserAddressByIdResponseModel {
  final DataUserAddressById? data;
  final Meta? meta;

  UserAddressByIdResponseModel({
    this.data,
    this.meta,
  });

  factory UserAddressByIdResponseModel.fromJson(String str) =>
      UserAddressByIdResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAddressByIdResponseModel.fromMap(Map<String, dynamic> json) =>
      UserAddressByIdResponseModel(
        data: json["data"] == null ? null : DataUserAddressById.fromMap(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "meta": meta?.toMap(),
      };
}

class DataUserAddressById {
  final int? id;
  final AttributesUserAddressById? attributes;

  DataUserAddressById({
    this.id,
    this.attributes,
  });

  factory DataUserAddressById.fromJson(String str) => DataUserAddressById.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataUserAddressById.fromMap(Map<String, dynamic> json) => DataUserAddressById(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : AttributesUserAddressById.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class AttributesUserAddressById {
  final String? namaReceiver;
  final String? phoneNumber;
  final String? address;
  final String? province;
  final String? city;
  final String? subdistrict;
  final String? postalCode;
  final bool? isDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  AttributesUserAddressById({
    this.namaReceiver,
    this.phoneNumber,
    this.address,
    this.province,
    this.city,
    this.subdistrict,
    this.postalCode,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory AttributesUserAddressById.fromJson(String str) =>
      AttributesUserAddressById.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AttributesUserAddressById.fromMap(Map<String, dynamic> json) => AttributesUserAddressById(
        namaReceiver: json["nama_receiver"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        province: json["province"],
        city: json["city"],
        subdistrict: json["subdistrict"],
        postalCode: json["postal_code"],
        isDefault: json["is_default"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "nama_receiver": namaReceiver,
        "phone_number": phoneNumber,
        "address": address,
        "province": province,
        "city": city,
        "subdistrict": subdistrict,
        "postal_code": postalCode,
        "is_default": isDefault,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toMap() => {};
}
