import 'dart:convert';

class UserAddressResponseModel {
  final List<DataUserAddress>? data;
  final Meta? meta;

  UserAddressResponseModel({
    this.data,
    this.meta,
  });

  factory UserAddressResponseModel.fromJson(String str) =>
      UserAddressResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAddressResponseModel.fromMap(Map<String, dynamic> json) =>
      UserAddressResponseModel(
        data: json["data"] == null
            ? []
            : List<DataUserAddress>.from(json["data"]!.map((x) => DataUserAddress.fromMap(x))),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "meta": meta?.toMap(),
      };
}

class DataUserAddress {
  final int? id;
  final UserAddressAtrributes? attributes;

  DataUserAddress({
    this.id,
    this.attributes,
  });

  factory DataUserAddress.fromJson(String str) => DataUserAddress.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataUserAddress.fromMap(Map<String, dynamic> json) => DataUserAddress(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : UserAddressAtrributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class UserAddressAtrributes {
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

  UserAddressAtrributes({
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

  factory UserAddressAtrributes.fromJson(String str) =>
      UserAddressAtrributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAddressAtrributes.fromMap(Map<String, dynamic> json) => UserAddressAtrributes(
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
  final Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromMap(json["pagination"]),
      );

  Map<String, dynamic> toMap() => {
        "pagination": pagination?.toMap(),
      };
}

class Pagination {
  final int? page;
  final int? pageSize;
  final int? pageCount;
  final int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory Pagination.fromJson(String str) =>
      Pagination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
