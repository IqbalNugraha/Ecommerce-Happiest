import 'package:ecommerce_final_task/common/components/custom_bottom_popup.dart';
import 'package:ecommerce_final_task/common/components/custom_button.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/common/components/custom_loading_state.dart';
import 'package:ecommerce_final_task/common/components/custom_row.dart';
import 'package:ecommerce_final_task/common/components/custom_seperator.dart';
import 'package:ecommerce_final_task/common/extensions/ext_format_currency.dart';
import 'package:ecommerce_final_task/presentation/cart/widgets/cart_model.dart';
import 'package:ecommerce_final_task/presentation/check_out/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/components/custom_container.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';
import '../bloc/list_cart/cart_list_bloc.dart';

class CartCheckoutWidget extends StatefulWidget {
  const CartCheckoutWidget({super.key});

  @override
  State<CartCheckoutWidget> createState() => _CartCheckoutWidgetState();
}

class _CartCheckoutWidgetState extends State<CartCheckoutWidget> {
  List<CartModel>? listCart;
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
              listCart = response;
              double totalPrice = 0;
              for (var element in response) {
                totalPrice += int.parse(element.product.attributes!.price!) *
                    element.quantity;
              }
              return Column(
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
                    width: 120,
                    colorSeperator: MyColors.neutral50Color,
                  ),
                  const SizedBox(height: 16),
                  CustomRow(
                    title: Variables.total,
                    value: totalPrice.doubleCurrencyFormatRp,
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    width: size.width,
                    btnColor: MyColors.brandColor,
                    function: () {
                      if (response.isEmpty) {
                        CustomPopupBottom.showModalBottom(
                          context,
                          _dialogValidation(context),
                        );
                      } else {
                        Navigations.pushNavigation(
                          context,
                          CheckoutPage(
                            totalPrice: totalPrice,
                          ),
                        );
                      }
                    },
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

  Widget _dialogValidation(BuildContext context) {
    return CustomContainer(
      height: 150,
      bgColor: Colors.transparent,
      padding: const EdgeInsets.all(16),
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FontHeebo(
            text: Variables.msgCartEmpty,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontColor: MyColors.blackColor,
            alignment: TextAlign.center,
          ),
          const SizedBox(height: 24),
          CustomButton(
            width: double.infinity,
            function: () {
              Navigations.popNavigation(context);
            },
            widget: const FontHeebo(
              text: Variables.btnOkay,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontColor: MyColors.neutralColor,
              alignment: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
