import 'package:ecommerce_final_task/common/components/custom_container.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/common/components/custom_seperator.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/user_address_response_model.dart';
import 'package:flutter/material.dart';

import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';

class ComponentAddress extends StatelessWidget {
  final DataUserAddress data;
  const ComponentAddress({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CustomContainer(
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.all(16),
        boxShadow: Variables.shadowRadius1,
        widget: Column(
          children: [
            const Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: MyColors.brandColor,
                ),
                SizedBox(width: 8),
                FontHeebo(
                  text: Variables.checkoutAddress,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontColor: MyColors.blackColor,
                  alignment: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const CustomSeperator(
              colorSeperator: MyColors.neutral20Color,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
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
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                  color: MyColors.greyColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
