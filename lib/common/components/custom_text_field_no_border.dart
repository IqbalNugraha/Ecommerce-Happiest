import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constans/colors.dart';

class CustomTextFieldNoBorder extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? errorText;
  final Function()? onTextEditingCompleted;
  final bool obscureText;
  final TextInputType textInputType;
  final Color underlineColor, errorColor;
  final Widget? suffixIcon;
  final int? limit, limitLines;
  final TextAlign textAlign;

  const CustomTextFieldNoBorder({
    super.key,
    required this.controller,
    required this.hint,
    this.onTextEditingCompleted,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.underlineColor = MyColors.brandColor,
    this.errorColor = MyColors.redColor,
    this.textAlign = TextAlign.start,
    this.suffixIcon,
    this.errorText,
    this.limit,
    this.limitLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onEditingComplete: onTextEditingCompleted,
      obscureText: obscureText,
      keyboardType: textInputType,
      maxLength: limit,
      maxLines: limitLines,
      style: GoogleFonts.poppins(
        color: MyColors.blackColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      textAlign: textAlign,
      decoration: InputDecoration(
        hintText: hint,
        errorText: errorText,
        hintStyle: GoogleFonts.poppins(
          color: MyColors.greyColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        errorStyle: GoogleFonts.poppins(
          color: errorColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: underlineColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: underlineColor),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: errorColor),
        ),
        suffixIcon: suffixIcon,
        counterText: "",
        isDense: true,
      ),
    );
  }
}
