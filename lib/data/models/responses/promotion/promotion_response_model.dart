import 'dart:convert';

class PromotionResponseModel {
    final DataPromotion? data;
    final Meta? meta;

    PromotionResponseModel({
        this.data,
        this.meta,
    });

    factory PromotionResponseModel.fromJson(String str) => PromotionResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PromotionResponseModel.fromMap(Map<String, dynamic> json) => PromotionResponseModel(
        data: json["data"] == null ? null : DataPromotion.fromMap(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "meta": meta?.toMap(),
    };
}

class DataPromotion {
    final int? id;
    final PromotionAttributes? attributes;

    DataPromotion({
        this.id,
        this.attributes,
    });

    factory DataPromotion.fromJson(String str) => DataPromotion.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DataPromotion.fromMap(Map<String, dynamic> json) => DataPromotion(
        id: json["id"],
        attributes: json["attributes"] == null ? null : PromotionAttributes.fromMap(json["attributes"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
    };
}

class PromotionAttributes {
    final String? title;
    final String? promotion;
    final double? value;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final DateTime? publishedAt;
    final int? stock;
    final ImagePromotion? image;

    PromotionAttributes({
        this.title,
        this.promotion,
        this.value,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
        this.stock,
        this.image,
    });

    factory PromotionAttributes.fromJson(String str) => PromotionAttributes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PromotionAttributes.fromMap(Map<String, dynamic> json) => PromotionAttributes(
        title: json["title"],
        promotion: json["promotion"],
        value: json["value"]?.toDouble(),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        stock: json["stock"],
        image: json["image"] == null ? null : ImagePromotion.fromMap(json["image"]),
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

class ImagePromotion {
    final ImageData? data;

    ImagePromotion({
        this.data,
    });

    factory ImagePromotion.fromJson(String str) => ImagePromotion.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ImagePromotion.fromMap(Map<String, dynamic> json) => ImagePromotion(
        data: json["data"] == null ? null : ImageData.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
    };
}

class ImageData {
    final int? id;
    final FluffyAttributes? attributes;

    ImageData({
        this.id,
        this.attributes,
    });

    factory ImageData.fromJson(String str) => ImageData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ImageData.fromMap(Map<String, dynamic> json) => ImageData(
        id: json["id"],
        attributes: json["attributes"] == null ? null : FluffyAttributes.fromMap(json["attributes"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
    };
}

class FluffyAttributes {
    final String? name;
    final dynamic alternativeText;
    final dynamic caption;
    final int? width;
    final int? height;
    final Formats? formats;
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

    FluffyAttributes({
        this.name,
        this.alternativeText,
        this.caption,
        this.width,
        this.height,
        this.formats,
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

    factory FluffyAttributes.fromJson(String str) => FluffyAttributes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FluffyAttributes.fromMap(Map<String, dynamic> json) => FluffyAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: json["formats"] == null ? null : Formats.fromMap(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats?.toMap(),
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

class Formats {
    final Large? thumbnail;
    final Large? medium;
    final Large? small;
    final Large? large;

    Formats({
        this.thumbnail,
        this.medium,
        this.small,
        this.large,
    });

    factory Formats.fromJson(String str) => Formats.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Formats.fromMap(Map<String, dynamic> json) => Formats(
        thumbnail: json["thumbnail"] == null ? null : Large.fromMap(json["thumbnail"]),
        medium: json["medium"] == null ? null : Large.fromMap(json["medium"]),
        small: json["small"] == null ? null : Large.fromMap(json["small"]),
        large: json["large"] == null ? null : Large.fromMap(json["large"]),
    );

    Map<String, dynamic> toMap() => {
        "thumbnail": thumbnail?.toMap(),
        "medium": medium?.toMap(),
        "small": small?.toMap(),
        "large": large?.toMap(),
    };
}

class Large {
    final String? name;
    final String? hash;
    final String? ext;
    final String? mime;
    final dynamic path;
    final int? width;
    final int? height;
    final double? size;
    final String? url;

    Large({
        this.name,
        this.hash,
        this.ext,
        this.mime,
        this.path,
        this.width,
        this.height,
        this.size,
        this.url,
    });

    factory Large.fromJson(String str) => Large.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Large.fromMap(Map<String, dynamic> json) => Large(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        path: json["path"],
        width: json["width"],
        height: json["height"],
        size: json["size"]?.toDouble(),
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "path": path,
        "width": width,
        "height": height,
        "size": size,
        "url": url,
    };
}

class Meta {
    Meta();

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
    );

    Map<String, dynamic> toMap() => {
    };
}
