import 'package:ecommerce_final_task/common/components/custom_container.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/common/constans/variables.dart';
import 'package:ecommerce_final_task/common/extensions/ext_format_currency.dart';
import 'package:ecommerce_final_task/data/models/responses/product/products_response_model.dart';
import 'package:ecommerce_final_task/presentation/cart/widgets/cart_model.dart';
import 'package:ecommerce_final_task/presentation/product/detail_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constans/api_services.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../cart/bloc/cart/cart_bloc.dart';

class ComponentProductWidget extends StatelessWidget {
  final ProductsResponse data;
  const ComponentProductWidget({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CartBloc>().add(CartEvent.add(CartModel(product: data)));
        Navigations.pushNavigation(
          context,
          DetailProductPage(
            data: data,
          ),
        );
      },
      child: CustomContainer(
        borderRadius: BorderRadius.circular(10),
        boxShadow: Variables.shadowRadius1,
        padding: const EdgeInsets.all(10),
        widget: Column(
          children: [
            Hero(
              tag: data.attributes!.image!.data!.first.attributes!.url!,
              child: Image.network(
                "${ApiServices.baseUrl}${data.attributes!.image!.data!.first.attributes!.url}",
                height: 148,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: FontHeebo(
                text: data.attributes!.name!,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                fontColor: MyColors.blackColor,
                alignment: TextAlign.start,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FontHeebo(
                text: int.parse(data.attributes!.price!).intCurrencyFormatRp,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontColor: MyColors.brandColor,
                alignment: TextAlign.start,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: MyColors.blackColor,
                ),
                const SizedBox(width: 4),
                FontHeebo(
                  text: data.attributes!.city!,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  fontColor: MyColors.blackColor,
                  alignment: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
