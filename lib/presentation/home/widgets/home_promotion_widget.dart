import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_final_task/common/components/custom_skelton.dart';
import 'package:ecommerce_final_task/presentation/home/widgets/component_promotion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/components/custom_font.dart';
import '../../../common/constans/colors.dart';
import '../bloc/promotion/promotion_bloc.dart';

class HomePromotionWidget extends StatefulWidget {
  const HomePromotionWidget({super.key});

  @override
  State<HomePromotionWidget> createState() => _HomePromotionWidgetState();
}

class _HomePromotionWidgetState extends State<HomePromotionWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromotionBloc, PromotionState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const CustomSkelton(
              height: 200,
              width: double.infinity,
            );
          },
          success: (response) {
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: CarouselSlider(
                    items: response.data!
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: PromotionComponentWidget(dataPromotion: e),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      initialPage: _current,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        _current = index;
                        setState(() {});
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: response.data!.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? MyColors.greyColor
                                  : MyColors.redColor)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
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
    );
  }
}
