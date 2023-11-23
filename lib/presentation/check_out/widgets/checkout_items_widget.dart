import 'package:ecommerce_final_task/presentation/check_out/widgets/component_item.dart';
import 'package:flutter/material.dart';

import '../../cart/widgets/cart_model.dart';

class CheckoutItemsWidget extends StatelessWidget {
  final List<CartModel> listCart;
  const CheckoutItemsWidget({super.key, required this.listCart});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: listCart.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ComponentItem(
            data: listCart[index],
          ),
        );
      },
    );
  }
}
