import 'package:ecommerce_final_task/common/components/custom_appbar.dart';
import 'package:ecommerce_final_task/common/components/custom_seperator.dart';
import 'package:ecommerce_final_task/presentation/check_out/bloc/address_by_default/address_by_default_bloc.dart';
import 'package:ecommerce_final_task/presentation/check_out/widgets/checkout_address_widget.dart';
import 'package:ecommerce_final_task/presentation/check_out/widgets/checkout_items_widget.dart';
import 'package:ecommerce_final_task/presentation/check_out/widgets/checkout_payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/components/custom_loading_state.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';
import '../cart/bloc/list_cart/cart_list_bloc.dart';
import '../cart/widgets/cart_model.dart';

class CheckoutPage extends StatefulWidget {
  final double totalPrice;
  const CheckoutPage({
    super.key,
    required this.totalPrice,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int idDestination = 0;
  List<CartModel> listCart = [];

  @override
  void initState() {
    print(widget.totalPrice);
    context
        .read<AddressByDefaultBloc>()
        .add(const AddressByDefaultEvent.getUserAddressByDefault(true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.neutralColor,
        body: Column(
          children: [
            CustomAppbar(
              title: Variables.cartAppbar,
              function: () {
                Navigations.popNavigation(context);
              },
            ),
            const SizedBox(height: 8),
            Expanded(
              child: BlocBuilder<CartListBloc, CartListState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const CustomLoadingState();
                    },
                    success: (carts) {
                      return ListView(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        children: [
                          const CheckoutAddressWidget(),
                          const SizedBox(height: 16),
                          const CustomSeperator(
                            colorSeperator: MyColors.greyColor,
                          ),
                          const SizedBox(height: 16),
                          CheckoutItemsWidget(
                            listCart: carts,
                          ),
                          const SizedBox(height: 16),
                          CheckoutPaymentWidget(
                            totalPrice: widget.totalPrice,
                            listCart: carts,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
