import 'package:ecommerce_final_task/common/components/custom_appbar.dart';
import 'package:ecommerce_final_task/presentation/voucher/widgets/component_voucher_widget.dart';
import 'package:ecommerce_final_task/presentation/home/bloc/promotion/promotion_bloc.dart';
import 'package:ecommerce_final_task/presentation/voucher/widgets/voucher_save_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/components/custom_font.dart';
import '../../common/components/custom_loading_state.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';

class PromotionPage extends StatefulWidget {
  const PromotionPage({super.key});

  @override
  State<PromotionPage> createState() => _PromotionPageState();
}

class _PromotionPageState extends State<PromotionPage> {
  int _idVoucher = 0;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.neutralColor,
        body: Stack(
          children: [
            Column(
              children: [
                CustomAppBar(
                  title: Variables.myVoucher,
                  function: () {
                    Navigations.popNavigation(context);
                  },
                ),
                const SizedBox(height: 24),
                BlocBuilder<PromotionBloc, PromotionState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const CustomLoadingState();
                      },
                      success: (response) {
                        if (response.data!.isEmpty) {
                          return const Center(
                            child: FontHeebo(
                              text: Variables.emptyCart,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontColor: MyColors.blackColor,
                              alignment: TextAlign.center,
                            ),
                          );
                        } else {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16),
                            itemCount: response.data!.length,
                            itemBuilder: (context, i) {
                              return ComponentVoucherWidget(
                                isSelected: _idVoucher == response.data![i].id,
                                data: response.data![i].attributes!,
                                onTap: () {
                                  _idVoucher = response.data![i].id!;
                                  if (_idVoucher == response.data![i].id) {
                                    setState(() {
                                      _isSelected = true;
                                    });
                                  }
                                },
                              );
                            },
                          );
                        }
                      },
                      error: (error) {
                        return Center(
                          child: FontHeebo(
                            text: error,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontColor: MyColors.blackColor,
                            alignment: TextAlign.center,
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
            VoucherSaveWidget(
              isSelected: _isSelected,
              idVoucher: _idVoucher,
            ),
          ],
        ),
      ),
    );
  }
}
