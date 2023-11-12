import 'package:flutter/material.dart';

import '../../../common/components/custom_font.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/variables.dart';
import '../../../data/models/responses/product/products_response_model.dart';
import 'component_slider_widget.dart';

class DetailAppbarWidget extends StatelessWidget {
  final ProductsResponse data;
  const DetailAppbarWidget({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: MyColors.blackColor),
      centerTitle: true,
      title: const FontHeebo(
        text: Variables.detailProduct,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontColor: MyColors.blackColor,
        alignment: TextAlign.start,
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: ComponentSliderWidget(data: data.attributes!),
      ),
    );
  }
}
