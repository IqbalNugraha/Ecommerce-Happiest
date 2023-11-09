import 'package:ecommerce_final_task/common/components/custom_container.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/common/constans/api_services.dart';
import 'package:ecommerce_final_task/common/constans/images.dart';
import 'package:ecommerce_final_task/common/constans/variables.dart';
import 'package:ecommerce_final_task/data/models/responses/promotion/promotion_response_model.dart';
import 'package:flutter/material.dart';

import '../../../common/constans/colors.dart';

class PromotionComponentWidget extends StatefulWidget {
  final DataPromotion dataPromotion;
  const PromotionComponentWidget({
    required this.dataPromotion,
    super.key,
  });

  @override
  State<PromotionComponentWidget> createState() =>
      _PromotionComponentWidgetState();
}

class _PromotionComponentWidgetState extends State<PromotionComponentWidget> {
  var bgColor = MyColors.brandColor;
  @override
  void initState() {
    if (widget.dataPromotion.id! % 2 == 1) {
      setState(() {
        bgColor = MyColors.neutral100Color;
      });
    } else {
      setState(() {
        bgColor;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomContainer(
      width: size.width,
      bgColor: bgColor,
      borderRadius: BorderRadius.circular(10),
      padding: const EdgeInsets.all(20),
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FontHeebo(
                  text: widget.dataPromotion.attributes!.title.toString(),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontColor: MyColors.neutralColor,
                  alignment: TextAlign.start,
                ),
                const SizedBox(height: 8),
                FontHeebo(
                  text: widget.dataPromotion.attributes!.promotion.toString(),
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  fontColor: MyColors.neutralColor,
                  alignment: TextAlign.start,
                ),
                const SizedBox(height: 16),
                CustomContainer(
                  width: 115,
                  height: 35,
                  borderRadius: BorderRadius.circular(20),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  bgColor: MyColors.neutralColor,
                  widget: FontHeebo(
                    text: Variables.getNow,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontColor: bgColor,
                    alignment: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Image.network(
            "${ApiServices.baseUrl}${widget.dataPromotion.attributes!.image!.data!.attributes!.url}",
            width: 90,
            height: 90,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(ImageAssets.logo);
            },
          ),
        ],
      ),
    );
  }
}
