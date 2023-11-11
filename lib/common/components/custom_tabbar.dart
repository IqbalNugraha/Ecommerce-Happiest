import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constans/colors.dart';

class CustomTabbar extends StatelessWidget {
  final Color labelColor, unselectedLabelColor;
  final Decoration? decoration;
  final List<Widget>? tabs;
  final bool isScrollable;
  const CustomTabbar({
    this.labelColor = MyColors.neutralColor,
    this.unselectedLabelColor = MyColors.brandColor,
    this.decoration,
    this.tabs,
    this.isScrollable = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelStyle: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w800,
      ),
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor,
      indicator: decoration,
      tabs: tabs!,
      isScrollable: isScrollable,
    );
  }
}
