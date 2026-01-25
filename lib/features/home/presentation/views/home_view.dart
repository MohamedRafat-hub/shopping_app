import 'package:flutter/material.dart';

import 'widets/custom_bottom_navigation_bar.dart';
import 'widets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFEBEBEB),
      body: HomeViewBody(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}






