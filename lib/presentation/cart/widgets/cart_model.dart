import 'package:ecommerce_final_task/common/extensions/ext_format_currency.dart';
import 'package:ecommerce_final_task/data/models/responses/product/products_response_model.dart';

class CartModel {
  final ProductsResponse product;
  int total;
  int quantity;

  CartModel({
    required this.product,
    this.total = 0,
    this.quantity = 0,
  });

  String get priceFormat => product.attributes!.price!.stringCurrencyFormatRp;
}
