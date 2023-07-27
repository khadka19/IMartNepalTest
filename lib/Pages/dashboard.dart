import 'package:flutter/material.dart';
import 'package:imart_project/Pages/home_page.dart';
import 'package:imart_project/Pages/my_cart.dart';
import 'package:imart_project/Pages/profile.dart';
import 'package:imart_project/Widgets/colors.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  void updateIndex(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  List _screens = [
    HomePage(),
    MyCart(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_travel), label: "MyCart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 245, 241, 241),
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.kPrimaryColor,
        onTap: updateIndex,
      ),
    );
  }
}
