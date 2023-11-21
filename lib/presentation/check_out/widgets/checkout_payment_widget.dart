import 'package:ecommerce_final_task/common/components/custom_seperator.dart';
import 'package:ecommerce_final_task/common/extensions/ext_format_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/components/custom_button.dart';
import '../../../common/components/custom_container.dart';
import '../../../common/components/custom_dropdown.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_loading_state.dart';
import '../../../common/components/custom_row.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/images.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';
import '../../voucher/bloc/promotion_by_id/promotion_by_id_bloc.dart';
import '../../voucher/voucher_page.dart';
import '../bloc/address_by_default/address_by_default_bloc.dart';
import '../bloc/shipping_cost/shipping_cost_bloc.dart';
import '../models/courier.dart';

class CheckoutPaymentWidget extends StatefulWidget {
  final double totalPrice;
  const CheckoutPaymentWidget({super.key, required this.totalPrice});

  @override
  State<CheckoutPaymentWidget> createState() => _CheckoutPaymentWidgetState();
}

class _CheckoutPaymentWidgetState extends State<CheckoutPaymentWidget> {
  String _courierName = 'jne';
  String _idSubdistrict = '0';
  double _courierPrice = 0;
  double _grandTotal = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<AddressByDefaultBloc, AddressByDefaultState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const CustomLoadingState();
          },
          success: (responseAddress) {
            _idSubdistrict =
                responseAddress.data!.first.attributes!.idSubdistrict!;
            context.read<ShippingCostBloc>().add(ShippingCostEvent.shippingCost(
                  origin: subdistrictOrigin,
                  destination: _idSubdistrict,
                  courier: _courierName,
                ));
            if (responseAddress.data!.isEmpty) {
              return const Center(
                child: FontHeebo(
                  text: Variables.msgEmptyAddress,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontColor: MyColors.blackColor,
                  alignment: TextAlign.center,
                ),
              );
            } else {
              return Column(
                children: [
                  CustomContainer(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: Variables.shadowRadius1,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FontHeebo(
                          text: Variables.courierDropdown,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontColor: MyColors.blackColor,
                          alignment: TextAlign.start,
                        ),
                        const SizedBox(height: 8),
                        CustomDropdown(
                          borderColor: MyColors.blackColor,
                          textColor: MyColors.blackColor,
                          items: couriers,
                          value: couriers.first,
                          onChanged: (value) {
                            _courierName = value!.code;
                            context
                                .read<ShippingCostBloc>()
                                .add(ShippingCostEvent.shippingCost(
                                  origin: subdistrictOrigin,
                                  destination: _idSubdistrict,
                                  courier: _courierName,
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<PromotionByIdBloc, PromotionByIdState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return const CustomLoadingState();
                        },
                        success: (responseVoucher) {
                          if (responseVoucher.data == null) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
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
                                        SvgPicture.asset(
                                            ImageAssets.iconDiscount),
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
                                  CustomRow(
                                    title: Variables.total,
                                    value: widget
                                        .totalPrice.doubleCurrencyFormatRp,
                                    textAlign: TextAlign.end,
                                  ),
                                  BlocBuilder<ShippingCostBloc,
                                      ShippingCostState>(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        orElse: () {
                                          return const CustomLoadingState();
                                        },
                                        success: (response) {
                                          _courierPrice = response
                                              .rajaongkir
                                              .results
                                              .first
                                              .costs
                                              .first
                                              .cost
                                              .first
                                              .value
                                              .toDouble();
                                          _grandTotal =
                                              widget.totalPrice + _courierPrice;
                                          return Column(
                                            children: [
                                              CustomRow(
                                                title: Variables.shippingCost,
                                                value: _courierPrice
                                                    .doubleCurrencyFormatRp,
                                                textAlign: TextAlign.end,
                                              ),
                                              const SizedBox(height: 8),
                                              const CustomSeperator(
                                                colorSeperator:
                                                    MyColors.greyColor,
                                              ),
                                              const SizedBox(height: 16),
                                              CustomRow(
                                                title: Variables.grandTotal,
                                                value: _grandTotal
                                                    .doubleCurrencyFormatRp,
                                                textAlign: TextAlign.end,
                                              ),
                                            ],
                                          );
                                        },
                                        error: (error) {
                                          return const SizedBox(height: 0);
                                        },
                                      );
                                    },
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
                              ),
                            );
                          } else {
                            double totalDiscount =
                                (responseVoucher.data!.attributes!.value!) *
                                    (widget.totalPrice.toDouble());

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  const SizedBox(height: 16),
                                  CustomRow(
                                    title: Variables.total,
                                    value: widget
                                        .totalPrice.doubleCurrencyFormatRp,
                                    textAlign: TextAlign.end,
                                  ),
                                  CustomRow(
                                    title: Variables.discount,
                                    value: totalDiscount.doubleCurrencyFormatRp,
                                    textAlign: TextAlign.end,
                                  ),
                                  BlocBuilder<ShippingCostBloc,
                                      ShippingCostState>(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        orElse: () {
                                          return const CustomLoadingState();
                                        },
                                        success: (response) {
                                          _courierPrice = response
                                              .rajaongkir
                                              .results
                                              .first
                                              .costs
                                              .first
                                              .cost
                                              .first
                                              .value
                                              .toDouble();
                                          _grandTotal = (widget.totalPrice +
                                                  _courierPrice) -
                                              totalDiscount;
                                          return Column(
                                            children: [
                                              CustomRow(
                                                title: Variables.shippingCost,
                                                value: _courierPrice
                                                    .doubleCurrencyFormatRp,
                                                textAlign: TextAlign.end,
                                              ),
                                              const SizedBox(height: 8),
                                              const CustomSeperator(
                                                colorSeperator:
                                                    MyColors.greyColor,
                                              ),
                                              const SizedBox(height: 16),
                                              CustomRow(
                                                title: Variables.grandTotal,
                                                value: _grandTotal
                                                    .doubleCurrencyFormatRp,
                                                textAlign: TextAlign.end,
                                              ),
                                            ],
                                          );
                                        },
                                        error: (error) {
                                          return const SizedBox(height: 0);
                                        },
                                      );
                                    },
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
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }
}
