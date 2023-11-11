import 'package:ecommerce_final_task/common/components/custom_loading_state.dart';
import 'package:ecommerce_final_task/common/extensions/ext_format_currency.dart';
import 'package:ecommerce_final_task/data/models/responses/product/products_response_model.dart';
import 'package:ecommerce_final_task/data/repository/init_bloc.dart';
import 'package:ecommerce_final_task/presentation/cart/bloc/list_cart/cart_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/components/custom_button.dart';
import '../../../common/components/custom_circle_avatar.dart';
import '../../../common/components/custom_container.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';
import '../../cart/bloc/bloc/cart_bloc.dart';

class DetailCartWidget extends StatelessWidget {
  final ProductsResponse data;
  const DetailCartWidget({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomContainer(
      width: size.width,
      height: 160,
      boxShadow: Variables.shadowRadius8,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      widget: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const CustomLoadingState();
            },
            success: (response) {
              var _total =
                  int.parse(data.attributes!.price!) * response.quantity;
              return Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (response.quantity > 1) {
                            context
                                .read<CartBloc>()
                                .add(CartEvent.remove(response));
                          }
                        },
                        child: const CustomCircleAvatar(
                          sizeRadius: 18,
                          bgColor: MyColors.neutral50Color,
                          widget: Icon(
                            Icons.remove,
                            color: MyColors.neutralColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      FontHeebo(
                        text: response.quantity.toString(),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontColor: MyColors.blackColor,
                        alignment: TextAlign.center,
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          context.read<CartBloc>().add(CartEvent.add(response));
                        },
                        child: const CustomCircleAvatar(
                          sizeRadius: 18,
                          bgColor: MyColors.brandColor,
                          widget: Icon(
                            Icons.add,
                            color: MyColors.neutralColor,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const FontHeebo(
                        text: Variables.total,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontColor: MyColors.blackColor,
                        alignment: TextAlign.center,
                      ),
                      const SizedBox(width: 4),
                      FontHeebo(
                        text: _total.intCurrencyFormatRp,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontColor: MyColors.blackColor,
                        alignment: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CustomButton(
                        width: 70,
                        height: 60,
                        btnColor: MyColors.neutralColor,
                        function: () {},
                        borderRadius: 10,
                        widget: const Icon(
                          Icons.favorite,
                          color: MyColors.neutral50Color,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomButton(
                          height: 60,
                          function: () {
                            Navigations.popNavigation(context);
                            RepositoryBloc.initBloc(context);
                            context
                                .read<CartListBloc>()
                                .add(CartListEvent.add(response));
                          },
                          borderRadius: 10,
                          widget: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: MyColors.neutralColor,
                                size: 28,
                              ),
                              SizedBox(width: 8),
                              FontHeebo(
                                text: Variables.addToCart,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontColor: MyColors.neutralColor,
                                alignment: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
