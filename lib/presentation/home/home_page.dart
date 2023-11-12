import 'package:ecommerce_final_task/presentation/home/widgets/home_appbar_widget.dart';
import 'package:ecommerce_final_task/presentation/home/widgets/home_products_widget.dart';
import 'package:ecommerce_final_task/presentation/home/widgets/home_promotion_widget.dart';
import 'package:flutter/material.dart';


import '../../common/constans/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.neutralColor,
        body: Column(
          children: [
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: HomeAppbarWidget(),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: HomePromotionWidget(),
            ),
            SizedBox(height: 12),
            Expanded(
              child: HomeProductsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
