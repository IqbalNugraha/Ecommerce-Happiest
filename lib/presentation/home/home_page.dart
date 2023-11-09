import 'package:ecommerce_final_task/presentation/home/widgets/promotion_widget.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../../common/constans/colors.dart';
import '../../common/constans/variables.dart';

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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                        badges.Badge(
                          badgeContent: Text(
                            "0",
                            style: TextStyle(color: Colors.white),
                          ),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: MyColors.blackColor,
                          ),
                        ),
                        Icon(
                          Icons.notifications_none_sharp,
                          color: MyColors.blackColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              PromotionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
