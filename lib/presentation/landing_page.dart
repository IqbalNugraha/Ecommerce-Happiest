import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/presentation/auth/login_page.dart';
import 'package:flutter/material.dart';

import '../common/components/custom_button.dart';
import '../common/components/custom_circle_avatar.dart';
import '../common/constans/colors.dart';
import '../common/constans/navigation.dart';
import '../common/constans/variables.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_current < 2) {
        if (mounted) {
          setState(() {
            _current++;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _current = 0;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: CarouselSlider(
                items: Variables.images.map((e) {
                  return Container(
                    width: size.width,
                    height: size.height,
                    color: Colors.transparent,
                    child: Image.asset(
                      e,
                      fit: BoxFit.fill,
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: false,
                  initialPage: _current,
                  viewportFraction: 1,
                  height: size.height,
                  onPageChanged: (index, reason) {
                    _current = index;
                  },
                ),
                carouselController: _controller,
              ),
            ),
            Positioned(
              bottom: 108,
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DotsIndicator(
                      dotsCount: Variables.images.length,
                      position: _current,
                      decorator: DotsDecorator(
                        activeColor: MyColors.neutralColor,
                        size: const Size.square(9.0),
                        activeSize: const Size(38, 10),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(
                      width: 220,
                      child: FontHeebo(
                        text: Variables.landingPage,
                        alignment: TextAlign.start,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        fontColor: MyColors.neutralColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const FontHeebo(
                      text: Variables.welcomePage,
                      alignment: TextAlign.start,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontColor: MyColors.neutralColor,
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          btnColor: MyColors.redColor,
                          height: 60,
                          function: () {
                            Navigations.pushNavigation(
                              context,
                              const LoginPage(),
                            );
                          },
                          widget: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                FontHeebo(
                                  text: Variables.getStarted,
                                  alignment: TextAlign.start,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  fontColor: MyColors.neutralColor,
                                ),
                                SizedBox(width: 8),
                                CustomCircleAvatar(
                                  sizeRadius: 16,
                                  bgColor: MyColors.neutralColor,
                                  widget: Icon(
                                    Icons.arrow_forward,
                                    color: MyColors.redColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const FontHeebo(
                          text: Variables.skip,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontColor: MyColors.neutralColor,
                          alignment: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
