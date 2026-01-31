import 'package:cartzy_app/features/auth/presentation/views/account_view.dart';
import 'package:cartzy_app/features/cart/presentation/views/cart_view.dart';
import 'package:cartzy_app/features/favourite/presentation/views/favourite_view.dart';
import 'package:cartzy_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
   CustomBottomNavigationBar({super.key, required this.currentIndex, this.onTap});
   final int currentIndex;
   final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: const Color(0xFFEBEBEB),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: onTap,
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