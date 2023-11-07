import 'package:flutter/material.dart';

import '../constans/colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double sizeRadius;
  final Color bgColor;
  final Widget widget;
  const CustomCircleAvatar({
    Key? key,
    this.sizeRadius = 28,
    this.bgColor = MyColors.brandColor,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(      
      radius: sizeRadius,
      backgroundColor: bgColor,
      child: widget,
    );
  }
}
