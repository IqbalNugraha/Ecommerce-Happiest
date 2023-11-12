import 'package:flutter/material.dart';

import '../../../common/components/custom_button.dart';
import '../../../common/components/custom_container.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';

class VoucherSaveWidget extends StatelessWidget {
  final bool isSelected;
  const VoucherSaveWidget({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return isSelected
        ? Positioned(
            bottom: 0,
            child: CustomContainer(
              width: size.width,
              boxShadow: Variables.shadowRadius8,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              widget: CustomButton(
                function: () {},
                widget: const FontHeebo(
                  text: Variables.btnSaveVoucher,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontColor: MyColors.neutralColor,
                  alignment: TextAlign.center,
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
