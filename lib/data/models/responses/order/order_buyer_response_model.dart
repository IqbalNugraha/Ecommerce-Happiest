import 'dart:convert';

class OrderBuyerResponseModel {
    final List<DataOrder>? data;
    final Meta? meta;

    OrderBuyerResponseModel({
        this.data,
        this.meta,
    });

    factory OrderBuyerResponseModel.fromJson(String str) => OrderBuyerResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OrderBuyerResponseModel.fromMap(Map<String, dynamic> json) => OrderBuyerResponseModel(
        data: json["data"] == null ? [] : List<DataOrder>.from(json["data"]!.map((x) => DataOrder.fromMap(x))),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "meta": meta?.toMap(),
    };
}

class DataOrder {
    final int? id;
    final Attributes? attributes;

    DataOrder({
        this.id,
        this.attributes,
    });

    factory DataOrder.fromJson(String str) => DataOrder.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DataOrder.fromMap(Map<String, dynamic> json) => DataOrder(
        id: json["id"],
        attributes: json["attributes"] == null ? null : Attributes.fromMap(json["attributes"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
    };
}

class Attributes {
    final List<Item>? items;
    final int? totalPrice;
    final String? deliveryAddress;
    final String? courierName;
    final int? courierPrice;
    final String? status;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final DateTime? publishedAt;
    final String? buyerId;

    Attributes({
        this.items,
        this.totalPrice,
        this.deliveryAddress,
        this.courierName,
        this.courierPrice,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.publishedAt,
        this.buyerId,
    });

    factory Attributes.fromJson(String str) => Attributes.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
        totalPrice: json["total_price"],
        deliveryAddress: json["delivery_address"],
        courierName: json["courier_name"],
        courierPrice: json["courier_price"],
        status: json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        buyerId: json["buyerId"],
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
        "buyerId": buyerId,
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
    final Pagination? pagination;

    Meta({
        this.pagination,
    });

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null ? null : Pagination.fromMap(json["pagination"]),
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

    factory Pagination.fromJson(String str) => Pagination.fromMap(json.decode(str));

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
