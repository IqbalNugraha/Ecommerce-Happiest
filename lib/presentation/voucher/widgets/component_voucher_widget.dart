import 'package:ecommerce_final_task/common/components/custom_container.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/data/models/responses/promotion/list_promotion_response_model.dart';
import 'package:flutter/material.dart';

import '../../../common/constans/api_services.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';

class ComponentVoucherWidget extends StatelessWidget {
  final bool isSelected;
  final PromotionAttributesList data;
  final VoidCallback onTap;
  const ComponentVoucherWidget({
    super.key,
    this.isSelected = false,
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        borderRadius: BorderRadius.circular(10),
        boxShadow: Variables.shadowRadius1,
        border: Border.all(
          color: isSelected ? MyColors.brandColor : MyColors.neutral20Color,
        ),
        widget: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                "${ApiServices.baseUrl}${data.image!.data!.attributes!.url.toString()}",
                width: 80,
                height: 60,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontHeebo(
                    text: data.title.toString(),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontColor: MyColors.blackColor,
                    alignment: TextAlign.start,
                  ),
                  const SizedBox(height: 16),
                  FontHeebo(
                    text: data.promotion.toString(),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontColor: MyColors.blackColor,
                    alignment: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
