import 'package:ecommerce_final_task/common/extensions/ext_format_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/components/custom_button.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_loading_state.dart';
import '../../../common/components/custom_row.dart';
import '../../../common/components/custom_seperator.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/images.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';
import '../../voucher/bloc/promotion_by_id/promotion_by_id_bloc.dart';
import '../../voucher/voucher_page.dart';

class CheckoutVoucherWidget extends StatelessWidget {
  final double totalPrice;
  const CheckoutVoucherWidget({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromotionByIdBloc, PromotionByIdState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const CustomLoadingState();
          },
          success: (responseVoucher) {
            if (responseVoucher.data == null) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    CustomButton(
                      btnColor: MyColors.neutralColor,
                      borderSide: const BorderSide(
                        color: MyColors.brandColor,
                      ),
                      function: () {
                        Navigations.pushNavigation(
                          context,
                          const PromotionPage(),
                        );
                      },
                      widget: Row(
                        children: [
                          SvgPicture.asset(ImageAssets.iconDiscount),
                          const SizedBox(width: 8),
                          const FontHeebo(
                            text: Variables.msgUseVoucher,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontColor: MyColors.blackColor,
                            alignment: TextAlign.start,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.keyboard_arrow_right,
                            color: MyColors.brandColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const FontHeebo(
                          text: Variables.total,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontColor: MyColors.blackColor,
                          alignment: TextAlign.start,
                        ),
                        FontHeebo(
                          text: totalPrice.doubleCurrencyFormatRp,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontColor: MyColors.brandColor,
                          alignment: TextAlign.start,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      btnColor: MyColors.brandColor,
                      function: () {},
                      widget: const FontHeebo(
                        text: Variables.btnCheckout,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontColor: MyColors.neutralColor,
                        alignment: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              double totalDiscount =
                  (responseVoucher.data!.attributes!.value!) *
                      (totalPrice.toDouble());
              double grandTotal = totalPrice - totalDiscount;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const FontHeebo(
                      text: Variables.totalCart,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontColor: MyColors.blackColor,
                      alignment: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const CustomSeperator(
                      width: 180,
                      colorSeperator: MyColors.neutral50Color,
                    ),
                    const SizedBox(height: 16),
                    CustomRow(
                      title: Variables.total,
                      value: totalPrice.doubleCurrencyFormatRp,
                    ),
                    const SizedBox(height: 16),
                    CustomRow(
                      title: Variables.discount,
                      value: totalDiscount.doubleCurrencyFormatRp,
                    ),
                    const SizedBox(height: 16),
                    CustomRow(
                      title: Variables.grandTotal,
                      value: grandTotal.doubleCurrencyFormatRp,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      btnColor: MyColors.brandColor,
                      function: () {},
                      widget: const FontHeebo(
                        text: Variables.btnCheckout,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontColor: MyColors.neutralColor,
                        alignment: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          error: (error) {
            return FontHeebo(
              text: error,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontColor: MyColors.redColor,
              alignment: TextAlign.center,
            );
          },
        );
      },
    );
  }
}
