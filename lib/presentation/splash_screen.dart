import 'package:ecommerce_final_task/data/datasources/local_remote_datasources.dart';
import 'package:ecommerce_final_task/presentation/bottom_navigation_page.dart';
import 'package:ecommerce_final_task/presentation/landing_page.dart';
import 'package:flutter/material.dart';

import '../common/constans/colors.dart';
import '../common/constans/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _checkAuth();
    super.initState();
  }

  void _checkAuth() async {
    final auth = await LocalRemoteDatasource().isLogin();
    if (auth == true) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigationPage(),
          ),
          (route) => false,
        );
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LandingPage(),
          ),
          (route) => false,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.brandColor,
      body: Center(
        child: Image.asset(
          ImageAssets.logo,
          width: 500,
          height: 500,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
