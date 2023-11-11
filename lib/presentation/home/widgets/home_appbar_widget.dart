import 'package:ecommerce_final_task/presentation/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../../../common/constans/colors.dart';
import '../../../common/constans/navigation.dart';
import '../../../common/constans/variables.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Variables.yourLocation,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: MyColors.blackColor,
              ),
            ),
            Row(
              children: [
                Text(
                  Variables.locationStatic,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: MyColors.blackColor,
                  ),
                ),
                SizedBox(height: 5),
                Icon(
                  Icons.expand_more,
                  size: 18.0,
                  color: MyColors.blackColor,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigations.pushNavigation(
                    context,
                    const CartPage(),
                  );
                },
                child: const badges.Badge(
                  badgeContent: Text(
                    "0",
                    style: TextStyle(color: Colors.white),
                  ),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: MyColors.blackColor,
                  ),
                ),
              ),
              const Icon(
                Icons.notifications_none_sharp,
                color: MyColors.blackColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
