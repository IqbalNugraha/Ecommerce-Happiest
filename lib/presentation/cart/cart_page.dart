import 'package:ecommerce_final_task/common/components/custom_appbar.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/common/components/custom_loading_state.dart';
import 'package:ecommerce_final_task/presentation/cart/widgets/component_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constans/colors.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';
import 'bloc/list_cart/cart_list_bloc.dart';

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
        body: Column(
          children: [
            CustomAppBar(
              title: Variables.cartAppbar,
              function: () {
                Navigations.popNavigation(context);
              },
            ),
            const SizedBox(height: 24),
            Expanded(
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
                                      physics:
                                          const NeverScrollableScrollPhysics(),
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
            ),
          ],
        ),
      ),
    );
  }
}
