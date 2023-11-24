import 'dart:convert';

class OrderDetailResponseModel {
    final DataOrderDetail? data;
    final Meta? meta;

    OrderDetailResponseModel({
        this.data,
        this.meta,
    });

    factory OrderDetailResponseModel.fromJson(String str) => OrderDetailResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OrderDetailResponseModel.fromMap(Map<String, dynamic> json) => OrderDetailResponseModel(
        data: json["data"] == null ? null : DataOrderDetail.fromMap(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "meta": meta?.toMap(),
    };
}

class DataOrderDetail {
    final int? id;
    final OrderDetail? attributes;

    DataOrderDetail({
        this.id,
        this.attributes,
    });

    factory DataOrderDetail.fromJson(String str) => DataOrderDetail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DataOrderDetail.fromMap(Map<String, dynamic> json) => DataOrderDetail(
        id: json["id"],
        attributes: json["attributes"] == null ? null : OrderDetail.fromMap(json["attributes"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
    };
}

class OrderDetail {
    final List<Item>? items;
    final int? totalPrice;
    final String? deliveryAddress;
    final String? courierName;
    final int? courierPrice;
    final String? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final DateTime? publishedAt;

    OrderDetail({
        this.items,
        this.totalPrice,
        this.deliveryAddress,
        this.courierName,
        this.courierPrice,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
    });

    factory OrderDetail.fromJson(String str) => OrderDetail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OrderDetail.fromMap(Map<String, dynamic> json) => OrderDetail(
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
        totalPrice: json["total_price"],
        deliveryAddress: json["delivery_address"],
        courierName: json["courier_name"],
        courierPrice: json["courier_price"],
        status: json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    );

    Map<String, dynamic> toMap() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toMap())),
        "total_price": totalPrice,
        "delivery_address": deliveryAddress,
        "courier_name": courierName,
        "courier_price": courierPrice,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
    };
}

class Item {
    final int? id;
    final String? name;
    final String? price;
    final int? qty;

    Item({
        this.id,
        this.name,
        this.price,
        this.qty,
    });

    factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        qty: json["qty"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "price": price,
        "qty": qty,
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
