import 'package:ecommerce_final_task/common/components/custom_container.dart';
import 'package:ecommerce_final_task/common/components/custom_loading_state.dart';
import 'package:ecommerce_final_task/data/models/requests/user_address/edit_user_address_request_model.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/user_address_response_model.dart';
import 'package:ecommerce_final_task/data/repository/init_bloc.dart';
import 'package:ecommerce_final_task/presentation/check_out/bloc/user_address/user_address_bloc.dart';
import 'package:ecommerce_final_task/presentation/user_address/add_address_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/components/custom_appbar_add.dart';
import '../../common/components/custom_button.dart';
import '../../common/components/custom_font.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';
import '../check_out/bloc/edit_address/edit_address_bloc.dart';
import 'widgets/component_address.dart';

class UserAddressPage extends StatefulWidget {
  const UserAddressPage({super.key});

  @override
  State<UserAddressPage> createState() => _UserAddressPageState();
}

class _UserAddressPageState extends State<UserAddressPage> {
  int _idAddress = 0;
  bool _isSelected = false;
  DataUserAddress? dataUserAddress;

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
            const FontHeebo(
              text: Variables.msgChooseAddress,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontColor: MyColors.blackColor,
              alignment: TextAlign.start,
            ),
            const SizedBox(height: 16),
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
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          separatorBuilder: (context, i) =>
                              const SizedBox(height: 16),
                          itemCount: response.data!.length,
                          itemBuilder: (context, i) {
                            return ComponentAddress(
                              isSelected: _idAddress == response.data![i].id,
                              data: response.data![i],
                              onTap: () {
                                _idAddress = response.data![i].id!;
                                if (_idAddress == response.data![i].id) {
                                  setState(() {
                                    _isSelected = true;
                                    dataUserAddress = response.data![i];
                                  });
                                }
                              },
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
        bottomNavigationBar: _isSelected
            ? BlocConsumer<EditAddressBloc, EditAddressState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return CustomContainer(
                        widget: CustomButton(
                          height: 60,
                          function: () {
                            final model = ModelEditUserAddress(
                              id: dataUserAddress!.id!,
                              namaReceiver:
                                  dataUserAddress!.attributes!.namaReceiver!,
                              phoneNumber:
                                  dataUserAddress!.attributes!.phoneNumber!,
                              address: dataUserAddress!.attributes!.address!,
                              province: dataUserAddress!.attributes!.province!,
                              city: dataUserAddress!.attributes!.city!,
                              subdistrict:
                                  dataUserAddress!.attributes!.subdistrict!,
                              postalCode:
                                  dataUserAddress!.attributes!.postalCode!,
                              idSubdistrict:
                                  dataUserAddress!.attributes!.idSubdistrict!,
                              isDefault: true,
                            );
                            context.read<EditAddressBloc>().add(
                                EditAddressEvent.editUserAddress(
                                    model, _idAddress));
                          },
                          widget: const FontHeebo(
                            text: Variables.btnSave,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontColor: MyColors.neutralColor,
                            alignment: TextAlign.center,
                          ),
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
                      Navigations.popNavigation(context);
                      RepositoryBloc.initBloc(context);
                    },
                    error: (error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(error),
                      ));
                    },
                  );
                },
              )
            : const SizedBox(),
      ),
    );
  }
}
