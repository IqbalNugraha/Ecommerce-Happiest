import 'package:ecommerce_final_task/common/components/custom_container.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/common/components/custom_loading_state.dart';
import 'package:ecommerce_final_task/common/components/custom_seperator.dart';
import 'package:ecommerce_final_task/presentation/check_out/bloc/user_address/user_address_bloc.dart';
import 'package:ecommerce_final_task/presentation/check_out/widgets/component_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';

class CheckoutAddressWidget extends StatefulWidget {
  const CheckoutAddressWidget({super.key});

  @override
  State<CheckoutAddressWidget> createState() => _CheckoutAddressWidgetState();
}

class _CheckoutAddressWidgetState extends State<CheckoutAddressWidget> {
  @override
  void initState() {
    context
        .read<UserAddressBloc>()
        .add(const UserAddressEvent.getUserAddressByDefault(true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CustomContainer(
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.all(16),
        boxShadow: Variables.shadowRadius1,
        widget: Column(
          children: [
            const Row(
              children: [
                Icon(
                  Icons.location_pin,
                  color: MyColors.brandColor,
                ),
                SizedBox(width: 8),
                FontHeebo(
                  text: Variables.checkoutAddress,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontColor: MyColors.blackColor,
                  alignment: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const CustomSeperator(
              colorSeperator: MyColors.neutral20Color,
            ),
            const SizedBox(height: 8),
            BlocBuilder<UserAddressBloc, UserAddressState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const CustomLoadingState();
                  },
                  success: (response) {
                    return ComponentAddress(data: response.data!.first);
                  },
                  error: (error) {
                    return FontHeebo(
                      text: error,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontColor: MyColors.redColor,
                      alignment: TextAlign.start,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
