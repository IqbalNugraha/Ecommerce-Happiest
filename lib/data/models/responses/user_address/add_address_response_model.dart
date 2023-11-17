import 'dart:convert';

class AddAddressResponseModel {
  final AddAddressResponseModelData? data;
  final Meta? meta;

  AddAddressResponseModel({
    this.data,
    this.meta,
  });

  factory AddAddressResponseModel.fromJson(String str) =>
      AddAddressResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddAddressResponseModel.fromMap(Map<String, dynamic> json) =>
      AddAddressResponseModel(
        data: json["data"] == null
            ? null
            : AddAddressResponseModelData.fromMap(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "meta": meta?.toMap(),
      };
}

class AddAddressResponseModelData {
  final int? id;
  final PurpleAttributes? attributes;

  AddAddressResponseModelData({
    this.id,
    this.attributes,
  });

  factory AddAddressResponseModelData.fromJson(String str) =>
      AddAddressResponseModelData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddAddressResponseModelData.fromMap(Map<String, dynamic> json) =>
      AddAddressResponseModelData(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : PurpleAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class PurpleAttributes {
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
  final User? user;

  PurpleAttributes({
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
    this.user,
  });

  factory PurpleAttributes.fromJson(String str) =>
      PurpleAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PurpleAttributes.fromMap(Map<String, dynamic> json) =>
      PurpleAttributes(
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
        user: json["user"] == null ? null : User.fromMap(json["user"]),
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
        "user": user?.toMap(),
      };
}

class User {
  final UserData? data;

  User({
    this.data,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        data: json["data"] == null ? null : UserData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
      };
}

class UserData {
  final int? id;
  final FluffyAttributes? attributes;

  UserData({
    this.id,
    this.attributes,
  });

  factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : FluffyAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class FluffyAttributes {
  final String? username;
  final String? email;
  final String? provider;
  final bool? confirmed;
  final bool? blocked;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FluffyAttributes({
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.createdAt,
    this.updatedAt,
  });

  factory FluffyAttributes.fromJson(String str) =>
      FluffyAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FluffyAttributes.fromMap(Map<String, dynamic> json) =>
      FluffyAttributes(
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toMap() => {};
}
