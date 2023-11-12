import 'package:ecommerce_final_task/presentation/product/widget/detail_appbar_widget.dart';
import 'package:ecommerce_final_task/presentation/product/widget/detail_cart_widget.dart';
import 'package:ecommerce_final_task/presentation/product/widget/detail_content_widget.dart';
import 'package:flutter/material.dart';

import '../../common/constans/colors.dart';
import '../../data/models/responses/product/products_response_model.dart';

class DetailProductPage extends StatefulWidget {
  final ProductsResponse data;
  const DetailProductPage({
    required this.data,
    super.key,
  });

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  DateTime _currentBackPressTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            backgroundColor: MyColors.neutralColor,
            body: Stack(
              children: [
                CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    DetailAppbarWidget(data: widget.data),
                    DetailContentWidget(data: widget.data),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: DetailCartWidget(
                    data: widget.data,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(_currentBackPressTime) >= const Duration(seconds: 1)) {
      _currentBackPressTime = now;
      // context
      //     .read<CartBloc>()
      //     .add(CartEvent.removeAll(CartModel(product: widget.data)));
    }
    return Future.value(true);
  }
}
