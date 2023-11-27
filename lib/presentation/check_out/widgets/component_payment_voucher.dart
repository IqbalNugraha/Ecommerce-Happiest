import 'package:ecommerce_final_task/common/extensions/ext_format_currency.dart';
import 'package:ecommerce_final_task/presentation/payment/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/components/custom_button.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_loading_state.dart';
import '../../../common/components/custom_row.dart';
import '../../../common/components/custom_seperator.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';
import '../../../data/datasources/local_remote_datasources.dart';
import '../../../data/models/requests/order/order_request_model.dart';
import '../../cart/widgets/cart_model.dart';
import '../bloc/order/order_bloc.dart';
import '../bloc/shipping_cost/shipping_cost_bloc.dart';

class ComponentPaymentVoucher extends StatefulWidget {
  final double totalDiscount, totalPrice;
  final List<CartModel> listCart;
  final String address, courierName;
  const ComponentPaymentVoucher({
    super.key,
    required this.totalDiscount,
    required this.totalPrice,
    required this.listCart,
    required this.address,
    required this.courierName,
  });

  @override
  State<ComponentPaymentVoucher> createState() =>
      _ComponentPaymentVoucherState();
}

class _ComponentPaymentVoucherState extends State<ComponentPaymentVoucher> {
  double? _courierPrice, _grandTotal;
  List<ItemProducts> items = [];
  int buyerId = 0;

  @override
  void initState() {
    getBuyerId();
    setState(() {
      items = widget.listCart
          .map(
            (e) => ItemProducts(
              id: e.product.id!,
              name: e.product.attributes!.name!,
              price: e.product.attributes!.price!,
              qty: e.quantity,
            ),
          )
          .toList();
    });
    super.initState();
  }

  void getBuyerId() async {
    buyerId = await LocalDatasource().getId();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          CustomRow(
            title: Variables.total,
            value: widget.totalPrice.doubleCurrencyFormatRp,
            textAlign: TextAlign.end,
          ),
          CustomRow(
            title: Variables.discount,
            value: widget.totalDiscount.doubleCurrencyFormatRp,
            textAlign: TextAlign.end,
          ),
          BlocBuilder<ShippingCostBloc, ShippingCostState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return const CustomLoadingState();
                },
                success: (response) {
                  _courierPrice = response
                      .rajaongkir.results.first.costs.first.cost.first.value
                      .toDouble();
                  _grandTotal = (widget.totalPrice + _courierPrice!) -
                      (widget.totalDiscount);
                  return Column(
                    children: [
                      CustomRow(
                        title: Variables.shippingCost,
                        value: _courierPrice!.doubleCurrencyFormatRp,
                        textAlign: TextAlign.end,
                      ),
                      const SizedBox(height: 8),
                      const CustomSeperator(
                        colorSeperator: MyColors.greyColor,
                      ),
                      const SizedBox(height: 16),
                      CustomRow(
                        title: Variables.grandTotal,
                        value: _grandTotal!.doubleCurrencyFormatRp,
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
          BlocConsumer<OrderBloc, OrderState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return CustomButton(
                    width: size.width,
                    btnColor: MyColors.brandColor,
                    function: () {
                      final model = OrderRequest(
                        items: items,
                        totalPrice: _grandTotal!.toInt(),
                        deliveryAddress: widget.address,
                        courierName: widget.courierName,
                        courierPrice: _courierPrice!.toInt(),
                        status: "waiting_payment",
                        buyerId: buyerId,
                      );
                      context.read<OrderBloc>().add(OrderEvent.order(
                            OrderRequestModel(data: model),
                          ));
                    },
                    widget: const FontHeebo(
                      text: Variables.btnCheckout,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontColor: MyColors.neutralColor,
                      alignment: TextAlign.start,
                    ),
                  );
                },
                loading: () {
                  return const CustomLoadingState();
                },
              );
            },
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (response) {
                  Navigations.pushNavigation(
                    context,
                    PaymentPage(
                      invoiceUrl: response.invoiceUrl!,
                      orderId: response.externalId!,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
