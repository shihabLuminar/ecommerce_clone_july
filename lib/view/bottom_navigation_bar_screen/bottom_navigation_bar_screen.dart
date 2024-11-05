import 'package:ecommerce_clone_july/utils/color_constants.dart';
import 'package:ecommerce_clone_july/view/home_screen/home_screen.dart';
import 'package:ecommerce_clone_july/view/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int selectedIndex = 0;
  final List screens = [
    HomeScreen(),
    WishlistScreen(),
    Center(child: Text("Search")),
    Center(child: Text("Settings")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.WHITE,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {},
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: ColorConstants.PRIMARY,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
              print(selectedIndex);
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
          ]),
    );
  }
}
