import 'package:ecommerce_final_task/common/components/custom_button.dart';
import 'package:ecommerce_final_task/common/components/custom_container.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/common/components/custom_seperator.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/user_address_response_model.dart';
import 'package:flutter/material.dart';

import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';

class ComponentAddress extends StatelessWidget {
  final VoidCallback onTap;
  final DataUserAddress data;
  final bool isSelected;
  const ComponentAddress({
    super.key,
    required this.onTap,
    required this.data,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.all(16),
        boxShadow: Variables.shadowRadius1,
        border: Border.all(
          color: isSelected ? MyColors.brandColor : MyColors.neutral20Color,
        ),
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  width: 120,
                  height: 40,
                  function: () {},
                  widget: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                      ),
                      SizedBox(width: 4),
                      FontHeebo(
                        text: Variables.btnEdit,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontColor: MyColors.neutralColor,
                        alignment: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  width: 120,
                  height: 40,
                  function: () {},
                  widget: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete,
                      ),
                      SizedBox(width: 4),
                      FontHeebo(
                        text: Variables.btnDelete,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontColor: MyColors.neutralColor,
                        alignment: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
