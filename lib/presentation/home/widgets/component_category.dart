import 'package:ecommerce_final_task/common/components/custom_container.dart';
import 'package:ecommerce_final_task/common/constans/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constans/colors.dart';

class ComponentCategory extends StatelessWidget {
  final String icon;
  const ComponentCategory({
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 70,
      height: 70,
      borderRadius: BorderRadius.circular(10),
      bgColor: MyColors.neutralColor,
      boxShadow: Variables.shadowRadius1,
      padding: const EdgeInsets.all(16),
      widget: SvgPicture.asset(icon),
    );
  }
}
