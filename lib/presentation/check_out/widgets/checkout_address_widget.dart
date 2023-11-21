import 'package:ecommerce_final_task/presentation/check_out/bloc/address_by_default/address_by_default_bloc.dart';
import 'package:ecommerce_final_task/presentation/check_out/widgets/component_checkout_address.dart';
import 'package:ecommerce_final_task/presentation/user_address/user_address_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/components/custom_button.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_loading_state.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';

class CheckoutAddressWidget extends StatelessWidget {
  const CheckoutAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressByDefaultBloc, AddressByDefaultState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const CustomLoadingState();
          },
          success: (response) {
            if (response.data!.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ComponentCheckoutAddress(
                  onTap: () {
                    Navigations.pushNavigation(
                      context,
                      const UserAddressPage(),
                    );
                  },
                  data: response.data!.first,
                ),
              );
            } else {
              return Column(
                children: [
                  const FontHeebo(
                    text: Variables.msgEmptyAddress,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontColor: MyColors.blackColor,
                    alignment: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  CustomButton(
                    function: () {
                      Navigations.pushNavigation(
                        context,
                        const UserAddressPage(),
                      );
                    },
                    widget: const FontHeebo(
                      text: Variables.btnAddAddress,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontColor: MyColors.neutralColor,
                      alignment: TextAlign.center,
                    ),
                  ),
                ],
              );
            }
          },
          error: (error) {
            return FontHeebo(
              text: error,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontColor: MyColors.redColor,
              alignment: TextAlign.center,
            );
          },
        );
      },
    );
  }
}
