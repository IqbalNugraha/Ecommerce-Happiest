import 'dart:convert';

class OrderRequestModel {
  final OrderRequest data;
  OrderRequestModel({
    required this.data,
  });

  OrderRequestModel copyWith({
    OrderRequest? data,
  }) {
    return OrderRequestModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
    };
  }

  factory OrderRequestModel.fromMap(Map<String, dynamic> map) {
    return OrderRequestModel(
      data: OrderRequest.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderRequestModel.fromJson(String source) =>
      OrderRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OrderRequestModel(data: $data)';

  @override
  bool operator ==(covariant OrderRequestModel other) {
    if (identical(this, other)) return true;

    return other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class OrderRequest {
  final List<ItemProducts> items;
  final int totalPrice;
  final String deliveryAddress;
  final String courierName;
  final int courierPrice;
  final String status;
  OrderRequest({
    required this.items,
    required this.totalPrice,
    required this.deliveryAddress,
    required this.courierName,
    required this.courierPrice,
    required this.status,
  });

  OrderRequest copyWith({
    List<ItemProducts>? items,
    int? totalPrice,
    String? deliveryAddress,
    String? courierName,
    int? courierPrice,
    String? status,
  }) {
    return OrderRequest(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      courierName: courierName ?? this.courierName,
      courierPrice: courierPrice ?? this.courierPrice,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
      'total_price': totalPrice,
      'delivery_address': deliveryAddress,
      'courier_name': courierName,
      'courier_price': courierPrice,
      'status': status,
    };
  }

  factory OrderRequest.fromMap(Map<String, dynamic> map) {
    return OrderRequest(
      items: List<ItemProducts>.from(
        (map['items'] as List<int>).map<ItemProducts>(
          (x) => ItemProducts.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalPrice: map['total_price'].toInt() as int,
      deliveryAddress: map['delivery_address'] as String,
      courierName: map['courier_name'] as String,
      courierPrice: map['courier_price'].toInt() as int,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderRequest.fromJson(String source) =>
      OrderRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ItemProducts {
  final int id;
  final String name;
  final String price;
  final int qty;
  ItemProducts({
    required this.id,
    required this.name,
    required this.price,
    required this.qty,
  });

  ItemProducts copyWith({
    int? id,
    String? name,
    String? price,
    int? qty,
  }) {
    return ItemProducts(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'qty': qty,
    };
  }

  factory ItemProducts.fromMap(Map<String, dynamic> map) {
    return ItemProducts(
      id: map['id'].toInt() as int,
      name: map['name'] as String,
      price: map['price'] as String,
      qty: map['qty'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemProducts.fromJson(String source) =>
      ItemProducts.fromMap(json.decode(source) as Map<String, dynamic>);
}
