import 'package:ecommerce_final_task/common/extensions/ext_format_currency.dart';
import 'package:flutter/material.dart';

import '../../../common/components/custom_container.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/constans/api_services.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';
import '../../cart/widgets/cart_model.dart';

class ComponentItem extends StatelessWidget {
  final CartModel data;
  const ComponentItem({super.key, required this.data});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FontHeebo(
                  text: data.product.attributes!.name!,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontColor: MyColors.blackColor,
                  alignment: TextAlign.start,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    FontHeebo(
                      text: data.total.intCurrencyFormatRp,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontColor: MyColors.blackColor,
                      alignment: TextAlign.start,
                    ),
                    const Spacer(),
                    FontHeebo(
                      text: "x${data.quantity}",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      fontColor: MyColors.blackColor,
                      alignment: TextAlign.end,
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
