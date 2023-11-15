import 'package:ecommerce_final_task/common/components/custom_bottom_popup.dart';
import 'package:ecommerce_final_task/common/components/custom_loading_state.dart';
import 'package:ecommerce_final_task/presentation/voucher/bloc/promotion_by_id/promotion_by_id_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/components/custom_button.dart';
import '../../../common/components/custom_container.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';

class VoucherSaveWidget extends StatefulWidget {
  final bool isSelected;
  final int idVoucher;
  const VoucherSaveWidget({
    super.key,
    required this.isSelected,
    required this.idVoucher,
  });

  @override
  State<VoucherSaveWidget> createState() => _VoucherSaveWidgetState();
}

class _VoucherSaveWidgetState extends State<VoucherSaveWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return widget.isSelected
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
              widget: BlocConsumer<PromotionByIdBloc, PromotionByIdState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return CustomButton(
                        function: () {
                          print(widget.idVoucher);
                          context.read<PromotionByIdBloc>().add(
                              PromotionByIdEvent.getPromotionById(
                                  widget.idVoucher));
                        },
                        widget: const FontHeebo(
                          text: Variables.btnSaveVoucher,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontColor: MyColors.neutralColor,
                          alignment: TextAlign.center,
                        ),
                      );
                    },
                    loading: () {
                      return const CustomLoadingState();
                    },
                  );
                },
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    success: (response) {
                      Navigator.of(context).pop();
                    },
                    error: (error) {
                      CustomPopupBottom.showModalBottom(
                        context,
                        _dialogValidation(context, error),
                      );
                    },
                  );
                },
              ),
            ),
          )
        : const SizedBox();
  }

  Widget _dialogValidation(BuildContext context, String value) {
    return CustomContainer(
      height: 150,
      bgColor: Colors.transparent,
      padding: const EdgeInsets.all(16),
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FontHeebo(
            text: value,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontColor: MyColors.blackColor,
            alignment: TextAlign.center,
          ),
          const SizedBox(height: 24),
          CustomButton(
            width: double.infinity,
            function: () {
              Navigations.popNavigation(context);
            },
            widget: const FontHeebo(
              text: Variables.btnOkay,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontColor: MyColors.neutralColor,
              alignment: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
