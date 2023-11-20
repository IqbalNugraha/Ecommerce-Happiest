import 'package:ecommerce_final_task/presentation/check_out/widgets/component_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/components/custom_loading_state.dart';
import '../../cart/bloc/list_cart/cart_list_bloc.dart';

class CheckoutItemsWidget extends StatelessWidget {
  const CheckoutItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartListBloc, CartListState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const CustomLoadingState();
          },
          success: (carts) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: carts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ComponentItem(
                    data: carts[index],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
