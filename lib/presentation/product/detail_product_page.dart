import 'package:ecommerce_final_task/common/components/custom_tabbar.dart';
import 'package:ecommerce_final_task/common/extensions/ext_format_currency.dart';
import 'package:ecommerce_final_task/presentation/cart/widgets/cart_model.dart';
import 'package:ecommerce_final_task/presentation/product/widget/detail_cart_widget.dart';
import 'package:ecommerce_final_task/presentation/product/widget/slider_detail_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/components/custom_font.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/variables.dart';
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
    final size = MediaQuery.of(context).size;

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
                    SliverAppBar(
                      expandedHeight: 300,
                      backgroundColor: Colors.transparent,
                      iconTheme:
                          const IconThemeData(color: MyColors.blackColor),
                      title: const FontHeebo(
                        text: Variables.detailProduct,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontColor: MyColors.blackColor,
                        alignment: TextAlign.start,
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: SliderDetailImageWidget(
                            data: widget.data.attributes!),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FontHeebo(
                                  text: widget.data.attributes!.name!,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontColor: MyColors.blackColor,
                                  alignment: TextAlign.start,
                                ),
                                FontHeebo(
                                  text:
                                      int.parse(widget.data.attributes!.price!)
                                          .intCurrencyFormatRp,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontColor: MyColors.brandColor,
                                  alignment: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          _componentDetail(
                            Variables.stock,
                            widget.data.attributes!.stock.toString(),
                          ),
                          const SizedBox(height: 16),
                          _componentDetail(
                            Variables.sendFrom,
                            widget.data.attributes!.city!,
                          ),
                          const SizedBox(height: 16),
                          const CustomTabbar(
                            labelColor: MyColors.brandColor,
                            decoration: UnderlineTabIndicator(
                                borderSide:
                                    BorderSide(color: MyColors.brandColor)),
                            unselectedLabelColor: MyColors.greyColor,
                            tabs: [
                              Tab(
                                text: Variables.description,
                              ),
                              Tab(
                                text: Variables.review,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: size.height,
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: FontHeebo(
                                    text: widget.data.attributes!.description!,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontColor: MyColors.blackColor,
                                    alignment: TextAlign.start,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Center(
                                    child: FontHeebo(
                                      text: Variables.emptyReview,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontColor: MyColors.blackColor,
                                      alignment: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 200),
                        ],
                      ),
                    ),
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

  Widget _componentDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: FontHeebo(
              text: title,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontColor: MyColors.blackColor,
              alignment: TextAlign.start,
            ),
          ),
          const SizedBox(width: 4),
          const FontHeebo(
            text: ":",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontColor: MyColors.blackColor,
            alignment: TextAlign.start,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: FontHeebo(
              text: value,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontColor: MyColors.blackColor,
              alignment: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
