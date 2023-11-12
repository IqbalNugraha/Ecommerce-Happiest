import 'package:ecommerce_final_task/common/components/custom_button.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/common/components/custom_loading_state.dart';
import 'package:ecommerce_final_task/common/constans/images.dart';
import 'package:ecommerce_final_task/common/extensions/ext_format_currency.dart';
import 'package:ecommerce_final_task/presentation/voucher/voucher_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/components/custom_container.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';
import '../bloc/list_cart/cart_list_bloc.dart';

class CartCheckoutWidget extends StatelessWidget {
  const CartCheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomContainer(
      width: size.width,
      boxShadow: Variables.shadowRadius8,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      widget: BlocBuilder<CartListBloc, CartListState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const CustomLoadingState();
            },
            success: (response) {
              int totalPrice = 0;
              for (var element in response) {
                totalPrice += int.parse(element.product.attributes!.price!) *
                    element.quantity;
              }
              return Column(
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
                        text: totalPrice.intCurrencyFormatRp,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontColor: MyColors.brandColor,
                        alignment: TextAlign.start,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    width: size.width,
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
              );
            },
          );
        },
      ),
    );
  }
}
