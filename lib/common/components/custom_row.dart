import 'package:flutter/material.dart';

import '../constans/colors.dart';
import 'custom_font.dart';

class CustomRow extends StatelessWidget {
  final String title, value;
  const CustomRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: FontHeebo(
              text: title,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontColor: MyColors.blackColor,
              alignment: TextAlign.start,
            ),
          ),
          const SizedBox(width: 4),
          const FontHeebo(
            text: ":",
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontColor: MyColors.blackColor,
            alignment: TextAlign.start,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: FontHeebo(
              text: value,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontColor: MyColors.blackColor,
              alignment: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
