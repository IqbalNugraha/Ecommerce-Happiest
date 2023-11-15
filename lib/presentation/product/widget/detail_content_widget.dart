import 'package:ecommerce_final_task/common/components/custom_row.dart';
import 'package:ecommerce_final_task/common/extensions/ext_format_currency.dart';
import 'package:flutter/material.dart';

import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_tabbar.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';
import '../../../data/models/responses/product/products_response_model.dart';

class DetailContentWidget extends StatelessWidget {
  final ProductsResponse data;
  const DetailContentWidget({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FontHeebo(
                  text: data.attributes!.name!,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontColor: MyColors.blackColor,
                  alignment: TextAlign.start,
                ),
                FontHeebo(
                  text: int.parse(data.attributes!.price!).intCurrencyFormatRp,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontColor: MyColors.brandColor,
                  alignment: TextAlign.start,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          CustomRow(
            title: Variables.stock,
            value: data.attributes!.stock.toString(),
          ),
          const SizedBox(height: 16),
          CustomRow(
            title: Variables.sendFrom,
            value: data.attributes!.city!,
          ),
          const SizedBox(height: 16),
          const CustomTabbar(
            labelColor: MyColors.brandColor,
            decoration: UnderlineTabIndicator(
                borderSide: BorderSide(color: MyColors.brandColor)),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FontHeebo(
                    text: data.attributes!.description!,
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
    );
  }
}
