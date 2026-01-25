import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: const Color(0xFFEBEBEB),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/home_icon.png'), label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/cart_icon.png'), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/fav_icon.png'),
              label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/profile_icon.png'),
              label: 'Account'),
        ]);
  }
}