import 'package:cartzy_app/features/home/presentation/views/widets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String id = 'CartView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Center(child: Image.asset('assets/images/cart_image.png')),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
