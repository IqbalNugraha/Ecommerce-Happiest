import 'package:ecommerce_final_task/common/components/custom_button.dart';
import 'package:ecommerce_final_task/common/components/custom_dropdown.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/common/components/custom_loading_state.dart';
import 'package:ecommerce_final_task/common/components/custom_text_field.dart';
import 'package:ecommerce_final_task/data/datasources/local_remote_datasources.dart';
import 'package:ecommerce_final_task/data/models/requests/user_address/user_address_request_model.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/city_response_model.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/province_response_model.dart';
import 'package:ecommerce_final_task/data/models/responses/user_address/subdistrict_response_model.dart';
import 'package:ecommerce_final_task/presentation/check_out/bloc/user_address/user_address_bloc.dart';
import 'package:ecommerce_final_task/presentation/user_address/bloc/city/city_bloc.dart';
import 'package:ecommerce_final_task/presentation/user_address/bloc/province/province_bloc.dart';
import 'package:ecommerce_final_task/presentation/user_address/bloc/subdistrict/subdistrict_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';
import '../../check_out/bloc/add_address/add_address_bloc.dart';

class AddAddressFormWidget extends StatefulWidget {
  const AddAddressFormWidget({super.key});

  @override
  State<AddAddressFormWidget> createState() => _AddAddressFormWidgetState();
}

class _AddAddressFormWidgetState extends State<AddAddressFormWidget> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var postalCodeController = TextEditingController();
  var addressController = TextEditingController();
  Province? _selectedProvince;
  City? _selectedCity;
  SubDistrict? _selectedSubdistrict;
  String? _province, _city, _subdistrict;

  @override
  void initState() {
    context.read<ProvinceBloc>().add(const ProvinceEvent.getProvince());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const FontHeebo(
          text: Variables.receiverName,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontColor: MyColors.blackColor,
          alignment: TextAlign.start,
        ),
        const SizedBox(height: 4),
        CustomTextField(
          controller: nameController,
          hint: Variables.hintName,
        ),
        const SizedBox(height: 8),
        const FontHeebo(
          text: Variables.receiverPhone,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontColor: MyColors.blackColor,
          alignment: TextAlign.start,
        ),
        const SizedBox(height: 4),
        CustomTextField(
          controller: phoneController,
          hint: Variables.hintPhoneNumber,
          limit: 13,
          textInputType: TextInputType.phone,
        ),
        const SizedBox(height: 8),
        const FontHeebo(
          text: Variables.receiverProvince,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontColor: MyColors.blackColor,
          alignment: TextAlign.start,
        ),
        const SizedBox(height: 4),
        BlocBuilder<ProvinceBloc, ProvinceState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const CustomLoadingState();
              },
              success: (response) {
                _selectedProvince = response.rajaongkir.results.first;
                return CustomDropdown(
                  borderColor: MyColors.blackColor,
                  textColor: MyColors.blackColor,
                  menuMaxHeight: 200,
                  items: response.rajaongkir.results,
                  value: _selectedProvince,
                  onChanged: (value) {
                    setState(() {
                      _selectedProvince = value;
                      _province = _selectedProvince!.province;
                      context.read<CityBloc>().add(CityEvent.getCities(
                            _selectedProvince!.provinceId,
                          ));
                    });
                  },
                );
              },
            );
          },
        ),
        _selectedProvince != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const FontHeebo(
                    text: Variables.receiverCity,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontColor: MyColors.blackColor,
                    alignment: TextAlign.start,
                  ),
                  const SizedBox(height: 4),
                  BlocBuilder<CityBloc, CityState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return const CustomLoadingState();
                        },
                        success: (response) {
                          _selectedCity = response.rajaongkir.results.first;
                          return CustomDropdown(
                            borderColor: MyColors.blackColor,
                            textColor: MyColors.blackColor,
                            menuMaxHeight: 200,
                            items: response.rajaongkir.results,
                            value: _selectedCity,
                            onChanged: (value) {
                              setState(() {
                                _selectedCity = value;
                                _city = _selectedCity!.cityName;
                                context
                                    .read<SubdistrictBloc>()
                                    .add(SubdistrictEvent.getSubDistrict(
                                      _selectedCity!.cityId,
                                    ));
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              )
            : const SizedBox(),
        _selectedCity != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const FontHeebo(
                    text: Variables.receiverSubdistrict,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontColor: MyColors.blackColor,
                    alignment: TextAlign.start,
                  ),
                  const SizedBox(height: 4),
                  BlocBuilder<SubdistrictBloc, SubdistrictState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return const CustomLoadingState();
                        },
                        success: (response) {
                          _selectedSubdistrict =
                              response.rajaongkir.results.first;
                          return CustomDropdown(
                            borderColor: MyColors.blackColor,
                            textColor: MyColors.blackColor,
                            menuMaxHeight: 200,
                            items: response.rajaongkir.results,
                            value: _selectedSubdistrict,
                            onChanged: (value) {
                              setState(() {
                                _selectedSubdistrict = value;
                                _subdistrict =
                                    _selectedSubdistrict!.subdistrictName;
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              )
            : const SizedBox(),
        const SizedBox(height: 8),
        const FontHeebo(
          text: Variables.receiverPostalCode,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontColor: MyColors.blackColor,
          alignment: TextAlign.start,
        ),
        const SizedBox(height: 4),
        CustomTextField(
          controller: postalCodeController,
          hint: Variables.hintPostalCode,
          limit: 6,
          textInputType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        const FontHeebo(
          text: Variables.receiverAddress,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontColor: MyColors.blackColor,
          alignment: TextAlign.start,
        ),
        const SizedBox(height: 4),
        CustomTextField(
          controller: addressController,
          hint: Variables.hintAddress,
          limitLines: 5,
          textInputType: TextInputType.multiline,
        ),
        const SizedBox(height: 32),
        BlocConsumer<AddAddressBloc, AddAddressState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return CustomButton(
                  function: () async {
                    final id = await LocalDatasource().getId();
                    if (mounted) {
                      context.read<AddAddressBloc>().add(
                            AddAddressEvent.addUserAddress(
                              UserAddressRequestModel(
                                data: Data(
                                  namaReceiver: nameController.text,
                                  phoneNumber: phoneController.text,
                                  address: addressController.text,
                                  province: _province!,
                                  city: _city!,
                                  subdistrict: _subdistrict!,
                                  postalCode: postalCodeController.text,
                                  isDefault: false,
                                  user: [id],
                                ),
                              ),
                            ),
                          );
                    }
                  },
                  widget: const FontHeebo(
                    text: Variables.btnSave,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontColor: MyColors.neutralColor,
                    alignment: TextAlign.start,
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
                context
                    .read<UserAddressBloc>()
                    .add(const UserAddressEvent.getAllUserAddress());
                Navigations.popNavigation(context);
              },
              error: (error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(error),
                ));
              },
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
