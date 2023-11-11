import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontHeebo extends StatefulWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final TextAlign alignment;
  const FontHeebo({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.fontColor,
    required this.alignment,
    super.key,
  });

  @override
  State<FontHeebo> createState() => _FontHeeboState();
}

class _FontHeeboState extends State<FontHeebo> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.heebo(
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        color: widget.fontColor,
      ),
      textAlign: widget.alignment,
    );
  }
}
