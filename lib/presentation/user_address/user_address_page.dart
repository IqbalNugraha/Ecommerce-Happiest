import 'package:ecommerce_final_task/common/components/custom_loading_state.dart';
import 'package:ecommerce_final_task/presentation/check_out/bloc/user_address/user_address_bloc.dart';
import 'package:ecommerce_final_task/presentation/user_address/add_address_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/components/custom_appbar_add.dart';
import '../../common/components/custom_font.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';
import '../check_out/widgets/component_address.dart';

class UserAddressPage extends StatefulWidget {
  const UserAddressPage({super.key});

  @override
  State<UserAddressPage> createState() => _UserAddressPageState();
}

class _UserAddressPageState extends State<UserAddressPage> {
  @override
  void initState() {
    context
        .read<UserAddressBloc>()
        .add(const UserAddressEvent.getAllUserAddress());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.neutralColor,
        body: Column(
          children: [
            CustomAppbarAdd(
              title: Variables.userAddress,
              function: () {
                Navigations.popNavigation(context);
              },
              addFunction: () {
                Navigations.pushNavigation(
                  context,
                  const AddAddressPage(),
                );
              },
            ),
            const SizedBox(height: 42),
            Expanded(
              child: BlocBuilder<UserAddressBloc, UserAddressState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const CustomLoadingState();
                    },
                    success: (response) {
                      if (response.data!.isNotEmpty) {
                        return ListView.separated(
                          separatorBuilder: (context, i) =>
                              const SizedBox(height: 16),
                          itemCount: response.data!.length,
                          itemBuilder: (context, i) {
                            return ComponentAddress(
                              data: response.data![i],
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: FontHeebo(
                            text: Variables.msgEmptyAddress,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontColor: MyColors.blackColor,
                            alignment: TextAlign.center,
                          ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
