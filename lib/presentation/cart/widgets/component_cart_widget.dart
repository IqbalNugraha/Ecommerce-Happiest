import 'package:ecommerce_final_task/common/components/custom_container.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/common/constans/variables.dart';
import 'package:ecommerce_final_task/common/extensions/ext_format_currency.dart';
import 'package:ecommerce_final_task/presentation/cart/bloc/list_cart/cart_list_bloc.dart';
import 'package:ecommerce_final_task/presentation/cart/widgets/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constans/api_services.dart';
import '../../../common/constans/colors.dart';

class ComponentCartWidget extends StatelessWidget {
  final CartModel data;
  const ComponentCartWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: const EdgeInsets.all(16.0),
      borderRadius: BorderRadius.circular(10),
      boxShadow: Variables.shadowRadius1,
      widget: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(
              '${ApiServices.baseUrl}${data.product.attributes!.image!.data!.first.attributes!.url}',
              width: 72.0,
              height: 72.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontHeebo(
                      text: data.product.attributes!.name!,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontColor: MyColors.blackColor,
                      alignment: TextAlign.start,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.delete,
                        color: MyColors.redColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FontHeebo(
                      text: data.total.intCurrencyFormatRp,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontColor: MyColors.blackColor,
                      alignment: TextAlign.start,
                    ),
                    const Spacer(),
                    CustomContainer(
                      padding: const EdgeInsets.all(1.0),
                      bgColor: MyColors.neutral20Color,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      widget: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (data.quantity > 1) {
                                context
                                    .read<CartListBloc>()
                                    .add(CartListEvent.remove(data));
                              }
                            },
                            child: Container(
                              color: MyColors.neutralColor,
                              child: const Icon(Icons.remove),
                            ),
                          ),
                          SizedBox(
                            width: 40.0,
                            child: Center(
                              child: Text(data.quantity.toString()),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<CartListBloc>()
                                  .add(CartListEvent.add(data));
                            },
                            child: Container(
                              color: MyColors.neutralColor,
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
