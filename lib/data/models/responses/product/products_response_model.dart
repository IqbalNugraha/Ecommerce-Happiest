import 'dart:convert';

class ProductsResponseModel {
  final List<ProductsResponse>? data;
  final Meta? meta;

  ProductsResponseModel({
    this.data,
    this.meta,
  });

  factory ProductsResponseModel.fromJson(String str) =>
      ProductsResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsResponseModel.fromMap(Map<String, dynamic> json) =>
      ProductsResponseModel(
        data: json["data"] == null
            ? []
            : List<ProductsResponse>.from(
                json["data"]!.map((x) => ProductsResponse.fromMap(x))),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "meta": meta?.toMap(),
      };
}

class ProductsResponse {
  final int? id;
  final ProductAttributes? attributes;

  ProductsResponse({
    this.id,
    this.attributes,
  });

  factory ProductsResponse.fromJson(String str) =>
      ProductsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductsResponse.fromMap(Map<String, dynamic> json) =>
      ProductsResponse(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : ProductAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class ProductAttributes {
  final String? name;
  final String? description;
  final int? stock;
  final String? price;
  final String? city;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final ImageProduct? image;
  final Categories? categories;

  ProductAttributes({
    this.name,
    this.description,
    this.stock,
    this.price,
    this.city,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.image,
    this.categories,
  });

  factory ProductAttributes.fromJson(String str) =>
      ProductAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductAttributes.fromMap(Map<String, dynamic> json) =>
      ProductAttributes(
        name: json["name"],
        description: json["description"],
        stock: json["stock"],
        price: json["price"],
        city: json["city"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        image: json["image"] == null ? null : ImageProduct.fromMap(json["image"]),
        categories: json["categories"] == null
            ? null
            : Categories.fromMap(json["categories"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "stock": stock,
        "price": price,
        "city": city,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "image": image?.toMap(),
        "categories": categories?.toMap(),
      };
}

class Categories {
  final List<CategoriesDatum>? data;

  Categories({
    this.data,
  });

  factory Categories.fromJson(String str) =>
      Categories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
        data: json["data"] == null
            ? []
            : List<CategoriesDatum>.from(
                json["data"]!.map((x) => CategoriesDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class CategoriesDatum {
  final int? id;
  final FluffyAttributes? attributes;

  CategoriesDatum({
    this.id,
    this.attributes,
  });

  factory CategoriesDatum.fromJson(String str) =>
      CategoriesDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoriesDatum.fromMap(Map<String, dynamic> json) => CategoriesDatum(
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
  final String? name;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  FluffyAttributes({
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory FluffyAttributes.fromJson(String str) =>
      FluffyAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FluffyAttributes.fromMap(Map<String, dynamic> json) =>
      FluffyAttributes(
        name: json["name"],
        description: json["description"],
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
        "name": name,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

class ImageProduct {
  final List<ImageDatum>? data;

  ImageProduct({
    this.data,
  });

  factory ImageProduct.fromJson(String str) => ImageProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageProduct.fromMap(Map<String, dynamic> json) => ImageProduct(
        data: json["data"] == null
            ? []
            : List<ImageDatum>.from(
                json["data"]!.map((x) => ImageDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class ImageDatum {
  final int? id;
  final TentacledAttributes? attributes;

  ImageDatum({
    this.id,
    this.attributes,
  });

  factory ImageDatum.fromJson(String str) =>
      ImageDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageDatum.fromMap(Map<String, dynamic> json) => ImageDatum(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : TentacledAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class TentacledAttributes {
  final String? name;
  final dynamic alternativeText;
  final dynamic caption;
  final int? width;
  final int? height;

  final String? hash;
  final Ext? ext;
  final Mime? mime;
  final double? size;
  final String? url;
  final dynamic previewUrl;
  final Provider? provider;
  final dynamic providerMetadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TentacledAttributes({
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

  factory TentacledAttributes.fromJson(String str) =>
      TentacledAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TentacledAttributes.fromMap(Map<String, dynamic> json) =>
      TentacledAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        hash: json["hash"],
        ext: extValues.map[json["ext"]]!,
        mime: mimeValues.map[json["mime"]]!,
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: providerValues.map[json["provider"]]!,
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
        "ext": extValues.reverse[ext],
        "mime": mimeValues.reverse[mime],
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": providerValues.reverse[provider],
        "provider_metadata": providerMetadata,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

enum Ext { JPG }

final extValues = EnumValues({".jpg": Ext.JPG});

enum Mime { IMAGE_JPEG }

final mimeValues = EnumValues({"image/jpeg": Mime.IMAGE_JPEG});

enum Provider { LOCAL }

final providerValues = EnumValues({"local": Provider.LOCAL});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
