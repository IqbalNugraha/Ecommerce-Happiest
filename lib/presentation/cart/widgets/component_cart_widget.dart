import 'package:ecommerce_final_task/common/components/custom_container.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/common/constans/variables.dart';
import 'package:ecommerce_final_task/common/extensions/ext_format_currency.dart';
import 'package:ecommerce_final_task/presentation/cart/widgets/cart_model.dart';
import 'package:flutter/material.dart';

import '../../../common/constans/api_services.dart';
import '../../../common/constans/colors.dart';

class ComponentCartWidget extends StatefulWidget {
  final CartModel data;
  const ComponentCartWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<ComponentCartWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<ComponentCartWidget> {
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
              '${ApiServices.baseUrl}${widget.data.product.attributes!.image!.data!.first.attributes!.url}',
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
                      text: widget.data.product.attributes!.name!,
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
                      text: widget.data.total.intCurrencyFormatRp,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontColor: MyColors.blackColor,
                      alignment: TextAlign.start,
                    ),
                    const Spacer(),
                    CustomContainer(
                      padding: const EdgeInsets.all(1.0),
                      bgColor: MyColors.neutral50Color,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      widget: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              color: MyColors.neutralColor,
                              child: const Icon(Icons.remove),
                            ),
                          ),
                          SizedBox(
                            width: 40.0,
                            child: Center(
                              child: Text(widget.data.quantity.toString()),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
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
