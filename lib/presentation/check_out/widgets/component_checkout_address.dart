import 'package:flutter/material.dart';

import '../../../common/components/custom_container.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_seperator.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';
import '../../../data/models/responses/user_address/user_address_response_model.dart';

class ComponentCheckoutAddress extends StatelessWidget {
  final VoidCallback onTap;
  final DataUserAddress data;
  const ComponentCheckoutAddress({
    super.key,
    required this.onTap,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.all(16),
        boxShadow: Variables.shadowRadius1,
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
              text:
                  "${data.attributes!.address.toString()}, ${data.attributes!.postalCode.toString()}",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontColor: MyColors.blackColor,
              alignment: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
