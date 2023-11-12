import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_loading_state.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';
import '../bloc/list_cart/cart_list_bloc.dart';
import 'component_cart_widget.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CartListBloc, CartListState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const CustomLoadingState();
            },
            success: (response) {
              if (response.isEmpty) {
                return const Center(
                  child: FontHeebo(
                    text: Variables.emptyCart,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontColor: MyColors.blackColor,
                    alignment: TextAlign.center,
                  ),
                );
              } else {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    BlocBuilder<CartListBloc, CartListState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return const CustomLoadingState();
                          },
                          success: (carts) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 16),
                              itemCount: carts.length,
                              itemBuilder: (context, index) {
                                return ComponentCartWidget(
                                  data: carts[index],
                                );
                              },
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
      ),
    );
  }
}
