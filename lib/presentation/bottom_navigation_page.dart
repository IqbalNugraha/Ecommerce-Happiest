import 'package:ecommerce_final_task/data/datasources/local_remote_datasources.dart';
import 'package:flutter/material.dart';

import '../common/constans/colors.dart';
import '../common/constans/variables.dart';
import 'home/home_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    const HomePage(),
    const Center(child: Text(Variables.search)),
    const Center(child: Text(Variables.profile)),
  ];

  List<BottomNavigationBarItem> _items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: Variables.home,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: Variables.search,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: Variables.profile,
    ),
  ];

  @override
  void initState() {
    checkAuth();
    super.initState();
  }

  void checkAuth() async {
    final isLogin = await LocalRemoteDatasource().isLogin();
    if (isLogin == true) {
      setState(() {
        _pages = [
          const HomePage(),
          const Center(child: Text(Variables.search)),
          const Center(child: Text(Variables.favorite)),
          const Center(child: Text(Variables.profile)),
        ];

        _items = const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: Variables.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: Variables.search,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: Variables.favorite,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: Variables.profile,
          ),
        ];
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.brandColor,
        onTap: _onItemTapped,
        items: _items,
      ),
    );
  }
}
