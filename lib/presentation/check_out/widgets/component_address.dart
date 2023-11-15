import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/user_address_response_model.dart';
import 'package:flutter/material.dart';

import '../../../common/constans/colors.dart';

class ComponentAddress extends StatelessWidget {
  final DataUserAddress data;
  const ComponentAddress({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FontHeebo(
          text: data.attributes!.namaReceiver.toString(),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontColor: MyColors.blackColor,
          alignment: TextAlign.start,
        ),
        const SizedBox(height: 4),
        FontHeebo(
          text: data.attributes!.phoneNumber.toString(),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontColor: MyColors.blackColor,
          alignment: TextAlign.start,
        ),
        const SizedBox(height: 4),
        FontHeebo(
          text: data.attributes!.address.toString(),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontColor: MyColors.blackColor,
          alignment: TextAlign.start,
        ),
        const SizedBox(height: 4),
        FontHeebo(
          text: data.attributes!.postalCode.toString(),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontColor: MyColors.blackColor,
          alignment: TextAlign.start,
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
