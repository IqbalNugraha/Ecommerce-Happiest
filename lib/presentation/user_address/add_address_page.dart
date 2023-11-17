import 'package:ecommerce_final_task/common/components/custom_appbar.dart';
import 'package:ecommerce_final_task/presentation/user_address/widgets/add_address_form_widget.dart';
import 'package:flutter/material.dart';

import '../../common/constans/colors.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';

class AddAddressPage extends StatelessWidget {
  const AddAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.neutralColor,
        body: Column(
          children: [
            CustomAppbar(
              title: Variables.addAddress,
              function: () {
                Navigations.popNavigation(context);
              },
            ),
            const SizedBox(height: 32),
            const Expanded(
              child: AddAddressFormWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
