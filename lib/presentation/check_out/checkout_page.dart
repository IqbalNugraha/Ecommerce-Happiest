import 'package:ecommerce_final_task/common/components/custom_appbar.dart';
import 'package:ecommerce_final_task/common/components/custom_seperator.dart';
import 'package:ecommerce_final_task/presentation/cart/widgets/cart_model.dart';
import 'package:ecommerce_final_task/presentation/check_out/bloc/user_address/user_address_bloc.dart';
import 'package:ecommerce_final_task/presentation/check_out/widgets/checkout_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constans/colors.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartModel> listCart;
  final double totalPrice;
  const CheckoutPage({
    super.key,
    required this.listCart,
    required this.totalPrice,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    context
        .read<UserAddressBloc>()
        .add(const UserAddressEvent.getUserAddressByDefault(true));
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
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: const [
                  CheckoutAddressWidget(),
                  SizedBox(height: 16),
                  CustomSeperator(
                    colorSeperator: MyColors.greyColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}