import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_final_task/common/components/custom_loading_state.dart';
import 'package:ecommerce_final_task/presentation/home/widgets/component_promotion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constans/colors.dart';
import '../bloc/promotion/promotion_bloc.dart';

class PromotionWidget extends StatefulWidget {
  const PromotionWidget({super.key});

  @override
  State<PromotionWidget> createState() => _PromotionWidgetState();
}

class _PromotionWidgetState extends State<PromotionWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromotionBloc, PromotionState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const CustomLoadingState();
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
        );
      },
    );
  }
}
