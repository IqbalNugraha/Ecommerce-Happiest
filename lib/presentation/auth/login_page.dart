import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/common/components/custom_loading_state.dart';
import 'package:ecommerce_final_task/data/models/requests/auth/login_request_model.dart';
import 'package:ecommerce_final_task/presentation/auth/register_page.dart';
import 'package:ecommerce_final_task/presentation/bottom_navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../common/components/custom_button.dart';
import '../../common/components/custom_container.dart';
import '../../common/components/custom_text_field.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/images.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';
import 'bloc/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DateTime _currentBackPressTime = DateTime.now();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _hidePassword = true;
  String? _errorText;

  @override
  void initState() {
    emailController.addListener(() {
      if (emailController.text.isEmpty && passwordController.text.isEmpty) {
        setState(() {
          _errorText = Variables.cantEmpty;
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Image.asset(
                ImageAssets.bgLogin,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              child: CustomContainer(
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
                        text: Variables.headerLogin,
                        alignment: TextAlign.center,
                        fontColor: MyColors.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 28),
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
                      errorText: _errorText,
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
                    const SizedBox(height: 8),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: FontHeebo(
                        text: Variables.forgotPassword,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontColor: MyColors.brandColor,
                        alignment: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 24),
                    BlocConsumer<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return CustomButton(
                              width: size.width,
                              function: () {
                                final model = LoginRequestModel(
                                  identifier: emailController.text,
                                  password: passwordController.text,
                                );
                                context
                                    .read<LoginBloc>()
                                    .add(LoginEvent.login(model));
                              },
                              widget: const FontHeebo(
                                text: Variables.btnLogin,
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
                              const BottomNavigationPage(),
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
                          text: Variables.notHaveAccount,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontColor: MyColors.blackColor,
                          alignment: TextAlign.center,
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigations.pushNavigation(
                              context,
                              const RegisterPage(),
                            );
                          },
                          child: const FontHeebo(
                            text: Variables.register,
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
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(_currentBackPressTime) >= const Duration(seconds: 1)) {
      _currentBackPressTime = now;
      var message = "Press again to exit";
      Fluttertoast.showToast(msg: message);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
