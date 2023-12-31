import 'dart:convert';

class ListPromotionResponseModel {
  final List<DataListPromotion>? data;
  final Meta? meta;

  ListPromotionResponseModel({
    this.data,
    this.meta,
  });

  factory ListPromotionResponseModel.fromJson(String str) =>
      ListPromotionResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListPromotionResponseModel.fromMap(Map<String, dynamic> json) =>
      ListPromotionResponseModel(
        data: json["data"] == null
            ? []
            : List<DataListPromotion>.from(
                json["data"]!.map((x) => DataListPromotion.fromMap(x))),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "meta": meta?.toMap(),
      };
}

class DataListPromotion {
  final int? id;
  final PromotionAttributesList? attributes;

  DataListPromotion({
    this.id,
    this.attributes,
  });

  factory DataListPromotion.fromJson(String str) =>
      DataListPromotion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataListPromotion.fromMap(Map<String, dynamic> json) =>
      DataListPromotion(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : PromotionAttributesList.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class PromotionAttributesList {
  final String? title;
  final String? promotion;
  final double? value;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final int? stock;
  final ImagePromotionList? image;

  PromotionAttributesList({
    this.title,
    this.promotion,
    this.value,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.stock,
    this.image,
  });

  factory PromotionAttributesList.fromJson(String str) =>
      PromotionAttributesList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PromotionAttributesList.fromMap(Map<String, dynamic> json) =>
      PromotionAttributesList(
        title: json["title"],
        promotion: json["promotion"],
        value: json["value"]?.toDouble(),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        stock: json["stock"],
        image: json["image"] == null
            ? null
            : ImagePromotionList.fromMap(json["image"]),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "promotion": promotion,
        "value": value,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "stock": stock,
        "image": image?.toMap(),
      };
}

class ImagePromotionList {
  final Data? data;

  ImagePromotionList({
    this.data,
  });

  factory ImagePromotionList.fromJson(String str) =>
      ImagePromotionList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImagePromotionList.fromMap(Map<String, dynamic> json) => ImagePromotionList(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
      };
}

class Data {
  final int? id;
  final DataAttributes? attributes;

  Data({
    this.id,
    this.attributes,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : DataAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class DataAttributes {
  final String? name;
  final dynamic alternativeText;
  final dynamic caption;
  final int? width;
  final int? height;
  final String? hash;
  final String? ext;
  final String? mime;
  final double? size;
  final String? url;
  final dynamic previewUrl;
  final String? provider;
  final dynamic providerMetadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DataAttributes({
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  factory DataAttributes.fromJson(String str) =>
      DataAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataAttributes.fromMap(Map<String, dynamic> json) => DataAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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
