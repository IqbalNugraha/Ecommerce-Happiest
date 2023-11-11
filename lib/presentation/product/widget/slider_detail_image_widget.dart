import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../common/constans/api_services.dart';
import '../../../common/constans/colors.dart';
import '../../../data/models/responses/product/products_response_model.dart';

class SliderDetailImageWidget extends StatefulWidget {
  final ProductAttributes data;
  const SliderDetailImageWidget({
    super.key,
    required this.data,
  });

  @override
  State<SliderDetailImageWidget> createState() =>
      _SliderDetailImageWidgetState();
}

class _SliderDetailImageWidgetState extends State<SliderDetailImageWidget> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 48),
        Hero(
          tag: widget.data.image!.data!.first.attributes!.url!,
          child: CarouselSlider(
            items: widget.data.image!.data!
                .map(
                  (e) => Image.network(
                    "${ApiServices.baseUrl}${e.attributes!.url}",
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
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
          children: widget.data.image!.data!.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 30,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  color: (Theme.of(context).brightness == Brightness.dark
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
  }
}
