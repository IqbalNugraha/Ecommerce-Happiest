import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:flutter/material.dart';

import '../constans/colors.dart';

class CustomAppbarAdd extends StatelessWidget {
  final String title;
  final double fontSize, paddingTop;
  final double? height;
  final Color bgColor, textColor;
  final FontWeight fontWeight;
  final VoidCallback function, addFunction;
  const CustomAppbarAdd({
    required this.title,
    required this.function,
    required this.addFunction,
    this.bgColor = Colors.transparent,
    this.textColor = MyColors.blackColor,
    this.paddingTop = 24,
    this.fontSize = 18,
    this.height,
    this.fontWeight = FontWeight.w600,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: height,
            color: bgColor,
            child: Center(
              child: FontHeebo(
                text: title,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontColor: textColor,
                alignment: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            left: 16,
            child: GestureDetector(
              onTap: function,
              child: Icon(
                Icons.arrow_back,
                color: textColor,
                size: 28,
              ),
            ),
          ),
          Positioned(
            right: 16,
            child: GestureDetector(
              onTap: addFunction,
              child: Icon(
                Icons.add,
                color: textColor,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class AppbarCustomNavigation extends StatelessWidget {
//   final Widget appbarWidget;
//   final Color bgColor;
//   const AppbarCustomNavigation({
//     required this.appbarWidget,
//     this.bgColor = MyColors.brandColor,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       width: size.width,
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(10),
//           bottomRight: Radius.circular(10),
//         ),
//         color: bgColor,
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black38,
//             spreadRadius: 1,
//             blurRadius: 2,
//           ),
//         ],
//       ),
//       child: appbarWidget,
//     );
//   }
// }
