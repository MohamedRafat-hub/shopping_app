import 'package:flutter/material.dart';

import '../../../auth/presentation/views/account_view.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../favourite/presentation/views/favourite_view.dart';
import 'widets/custom_bottom_navigation_bar.dart';
import 'widets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeViewBody(),
    CartView(),
    FavouriteView(),
    AccountView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },

      ),
    );
  }
}






