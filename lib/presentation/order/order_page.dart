import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/presentation/order/bloc/buyer_order/buyer_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/components/custom_appbar.dart';
import '../../common/components/custom_loading_state.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/variables.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    context.read<BuyerOrderBloc>().add(const BuyerOrderEvent.getBuyerOrder());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.neutralColor,
        body: Column(
          children: [
            CustomAppbar(
              title: Variables.myOrder,
              function: () {},
            ),
            const SizedBox(height: 32),
            Expanded(
              child: BlocBuilder<BuyerOrderBloc, BuyerOrderState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const CustomLoadingState();
                    },
                    success: (response) {
                      if (response.data!.isEmpty) {
                        return const Center(
                          child: FontHeebo(
                            text: Variables.msgEmptyOrder,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontColor: MyColors.blackColor,
                            alignment: TextAlign.center,
                          ),
                        );
                      } else {
                        return ListView.separated(
                          itemCount: response.data!.length,
                          separatorBuilder: (context, i) => const SizedBox(
                            height: 16,
                          ),
                          itemBuilder: (context, i) {},
                        );
                      }
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
