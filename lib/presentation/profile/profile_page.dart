import 'package:ecommerce_final_task/common/components/custom_circle_avatar.dart';
import 'package:ecommerce_final_task/common/components/custom_container.dart';
import 'package:ecommerce_final_task/common/components/custom_font.dart';
import 'package:ecommerce_final_task/data/datasources/local_remote_datasources.dart';
import 'package:ecommerce_final_task/presentation/auth/login_page.dart';
import 'package:ecommerce_final_task/presentation/user_address/user_address_page.dart';
import 'package:flutter/material.dart';

import '../../common/constans/colors.dart';
import '../../common/constans/images.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.neutralColor,
        body: Column(
          children: [
            const SizedBox(height: 48),
            CustomCircleAvatar(
              sizeRadius: 80,
              widget: Image.asset(
                ImageAssets.logo,
                fit: BoxFit.cover,
                width: 300,
                height: 300,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: CustomContainer(
                bgColor: MyColors.neutralColor,
                boxShadow: Variables.shadowRadius1,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                widget: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: MyColors.brandColor,
                        size: 28,
                      ),
                      title: const FontHeebo(
                        text: Variables.btnProfile,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontColor: MyColors.blackColor,
                        alignment: TextAlign.start,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.shopping_bag_rounded,
                        color: MyColors.brandColor,
                        size: 28,
                      ),
                      title: const FontHeebo(
                        text: Variables.btnOrder,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontColor: MyColors.blackColor,
                        alignment: TextAlign.start,
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.local_shipping,
                        color: MyColors.brandColor,
                        size: 28,
                      ),
                      title: const FontHeebo(
                        text: Variables.btnAddress,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontColor: MyColors.blackColor,
                        alignment: TextAlign.start,
                      ),
                      onTap: () {
                        Navigations.pushNavigation(
                          context,
                          const UserAddressPage(),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.exit_to_app,
                        color: MyColors.brandColor,
                        size: 28,
                      ),
                      title: const FontHeebo(
                        text: Variables.btnExit,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontColor: MyColors.blackColor,
                        alignment: TextAlign.start,
                      ),
                      onTap: () async {
                        await LocalDatasource().removeAuthData();
                        if (mounted) {
                          Navigations.pushAndRemoveNavigation(
                            context,
                            const LoginPage(),
                          );
                        }
                      },
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
