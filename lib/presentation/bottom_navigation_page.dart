import 'package:ecommerce_final_task/common/constans/variables.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import '../common/constans/colors.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);
  int maxCount = 3;

  // widget list
  final List<Widget> _bottomBarPages = [
    Container(),
    Container(),
    Container(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            _bottomBarPages.length, (index) => _bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (_bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              showLabel: false,
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: MyColors.greyColor,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: MyColors.redColor,
                  ),
                  itemLabel: Variables.home,
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.search,
                    color: MyColors.greyColor,
                  ),
                  activeItem: Icon(
                    Icons.search,
                    color: MyColors.redColor,
                  ),
                  itemLabel: Variables.search,
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.people,
                    color: MyColors.greyColor,
                  ),
                  activeItem: Icon(
                    Icons.people,
                    color: MyColors.redColor,
                  ),
                  itemLabel: Variables.profile,
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}
