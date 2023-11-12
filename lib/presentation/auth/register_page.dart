import 'package:ecommerce_final_task/common/components/custom_container.dart';
import 'package:ecommerce_final_task/common/components/custom_loading_state.dart';
import 'package:ecommerce_final_task/data/models/requests/auth/register_request_model.dart';
import 'package:ecommerce_final_task/presentation/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/components/custom_button.dart';
import '../../common/components/custom_font.dart';
import '../../common/components/custom_text_field.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/images.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';
import 'bloc/register/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  bool _hidePassword = true;
  bool _hideRePassword = true;
  String? _errorText;

  @override
  void initState() {
    passwordController.addListener(() {
      if (passwordController.text.isEmpty &&
          rePasswordController.text.isEmpty) {
        setState(() {
          _errorText = Variables.msgPasswordEmpty;
        });
      } else if (passwordController.text != rePasswordController.text) {
        setState(() {
          _errorText = Variables.msgPasswordNotSame;
        });
      } else {
        setState(() {
          _errorText = null;
        });
      }
    });
    rePasswordController.addListener(() {
      if (passwordController.text != rePasswordController.text) {
        setState(() {
          _errorText = Variables.msgPasswordNotSame;
        });
      } else {
        setState(() {
          _errorText = null;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.bgLogin),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomContainer(
                    width: size.width,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    bgColor: MyColors.neutralColor,
                    padding: const EdgeInsets.all(16),
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        SizedBox(
                          width: size.width,
                          child: const FontHeebo(
                            text: Variables.headerRegister,
                            alignment: TextAlign.center,
                            fontColor: MyColors.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 28),
                        const FontHeebo(
                          text: Variables.name,
                          fontColor: MyColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          alignment: TextAlign.start,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: fullnameController,
                          hint: Variables.hintName,
                        ),
                        const SizedBox(height: 16),
                        const FontHeebo(
                          text: Variables.email,
                          fontColor: MyColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          alignment: TextAlign.start,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: emailController,
                          hint: Variables.hintEmail,
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        const FontHeebo(
                          text: Variables.password,
                          fontColor: MyColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          alignment: TextAlign.start,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: passwordController,
                          hint: Variables.hintPassword,
                          obscureText: _hidePassword,
                          errorText: _errorText,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _hidePassword = !_hidePassword;
                              });
                            },
                            child: Icon(
                              _hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility_rounded,
                              color: MyColors.semiBlackColor,
                            ),
                          ),
                          limitLines: 1,
                        ),
                        const SizedBox(height: 16),
                        const FontHeebo(
                          text: Variables.rePassword,
                          fontColor: MyColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          alignment: TextAlign.start,
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: rePasswordController,
                          hint: Variables.hintRePassword,
                          obscureText: _hideRePassword,
                          errorText: _errorText,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _hideRePassword = !_hideRePassword;
                              });
                            },
                            child: Icon(
                              _hideRePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility_rounded,
                              color: MyColors.semiBlackColor,
                            ),
                          ),
                          limitLines: 1,
                        ),
                        const SizedBox(height: 32),
                        BlocConsumer<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () {
                                return CustomButton(
                                  width: size.width,
                                  function: () {
                                    final model = RegisterRequestModel(
                                      name: fullnameController.text,
                                      password: passwordController.text,
                                      email: emailController.text,
                                      username: fullnameController.text
                                          .replaceAll(' ', ''),
                                    );
                                    context
                                        .read<RegisterBloc>()
                                        .add(RegisterEvent.register(model));
                                  },
                                  widget: const FontHeebo(
                                    text: Variables.btnRegister,
                                    fontSize: 14,
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
                                Navigations.pushAndRemoveNavigation(
                                  context,
                                  const LoginPage(),
                                );
                              },
                              error: (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(error),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FontHeebo(
                              text: Variables.haveAccount,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontColor: MyColors.blackColor,
                              alignment: TextAlign.center,
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                Navigations.pushAndRemoveNavigation(
                                  context,
                                  const LoginPage(),
                                );
                              },
                              child: const FontHeebo(
                                text: Variables.login,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontColor: MyColors.brandColor,
                                alignment: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
