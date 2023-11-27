import 'package:ecommerce_final_task/presentation/check_out/widgets/component_payment_no_voucher.dart';
import 'package:ecommerce_final_task/presentation/check_out/widgets/component_payment_voucher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/components/custom_container.dart';
import '../../../common/components/custom_dropdown.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_loading_state.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';
import '../../cart/widgets/cart_model.dart';
import '../../voucher/bloc/promotion_by_id/promotion_by_id_bloc.dart';
import '../bloc/address_by_default/address_by_default_bloc.dart';
import '../bloc/shipping_cost/shipping_cost_bloc.dart';
import '../models/courier.dart';

class CheckoutPaymentWidget extends StatefulWidget {
  final double totalPrice;
  final List<CartModel> listCart;
  const CheckoutPaymentWidget({
    super.key,
    required this.totalPrice,
    required this.listCart,
  });

  @override
  State<CheckoutPaymentWidget> createState() => _CheckoutPaymentWidgetState();
}

class _CheckoutPaymentWidgetState extends State<CheckoutPaymentWidget> {
  String _courierName = 'jne';
  String _idSubdistrict = '0';
  String _deliveryAddress = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressByDefaultBloc, AddressByDefaultState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const CustomLoadingState();
          },
          success: (responseAddress) {
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
              _idSubdistrict =
                  responseAddress.data!.first.attributes!.idSubdistrict!;
              _deliveryAddress =
                  responseAddress.data!.first.attributes!.address!;
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
                            return ComponentPaymentNoVoucher(
                              totalPrice: widget.totalPrice,
                              listCart: widget.listCart,
                              address: _deliveryAddress,
                              courierName: _courierName,
                            );
                          } else {
                            double totalDiscount =
                                (responseVoucher.data!.attributes!.value!) *
                                    (widget.totalPrice.toDouble());

                            return ComponentPaymentVoucher(
                              totalDiscount: totalDiscount,
                              totalPrice: widget.totalPrice,
                              listCart: widget.listCart,
                              address: _deliveryAddress,
                              courierName: _courierName,
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
