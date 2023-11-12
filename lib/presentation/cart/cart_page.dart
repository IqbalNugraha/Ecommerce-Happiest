import 'package:ecommerce_final_task/common/components/custom_appbar.dart';
import 'package:ecommerce_final_task/presentation/cart/widgets/cart_checkout_widget.dart';
import 'package:ecommerce_final_task/presentation/cart/widgets/cart_list_widget.dart';
import 'package:flutter/material.dart';

import '../../common/constans/colors.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.neutralColor,
        body: Stack(
          children: [
            Column(
              children: [
                CustomAppBar(
                  title: Variables.cartAppbar,
                  function: () {
                    Navigations.popNavigation(context);
                  },
                ),
                const SizedBox(height: 24),
                const CartListWidget(),
              ],
            ),
            const Positioned(
              bottom: 0,
              child: CartCheckoutWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
