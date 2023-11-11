import 'package:ecommerce_final_task/presentation/home/widgets/component_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/components/custom_container.dart';
import '../../../common/components/custom_font.dart';
import '../../../common/components/custom_loading_state.dart';
import '../../../common/constans/colors.dart';
import '../../../common/constans/images.dart';
import '../../../common/constans/variables.dart';
import '../../category/category_model.dart';
import '../bloc/product/product_bloc.dart';
import 'component_product_widget.dart';

class HomeProductsWidget extends StatefulWidget {
  const HomeProductsWidget({super.key});

  @override
  State<HomeProductsWidget> createState() => _HomeProductsWidgetState();
}

class _HomeProductsWidgetState extends State<HomeProductsWidget> {
  List<CategoryModel> listCategory = [
    CategoryModel(icon: ImageAssets.iconClothe),
    CategoryModel(icon: ImageAssets.iconPant),
    CategoryModel(icon: ImageAssets.iconJacket),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const FontHeebo(
                text: Variables.categories,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontColor: MyColors.blackColor,
                alignment: TextAlign.start,
              ),
              CustomContainer(
                bgColor: MyColors.neutralColor,
                padding: const EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(20),
                boxShadow: Variables.shadowRadius1,
                widget: const FontHeebo(
                  text: Variables.categories,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontColor: MyColors.brandColor,
                  alignment: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listCategory.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ComponentCategory(
                    icon: listCategory[i].icon,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return SizedBox(
                  height: size.height,
                  child: const CustomLoadingState(),
                );
              },
              success: (response) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: response.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: ComponentProductWidget(
                        data: response.data![i],
                      ),
                    );
                  },
                );
              },
              error: (error) {
                return FontHeebo(
                  text: error,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontColor: MyColors.brandColor,
                  alignment: TextAlign.center,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
