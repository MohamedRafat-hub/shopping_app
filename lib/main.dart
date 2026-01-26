import 'package:cartzy_app/features/auth/presentation/views/login_view.dart';
import 'package:cartzy_app/features/auth/presentation/views/signup_view.dart';
import 'package:cartzy_app/features/cart/presentation/views/cart_view.dart';
import 'package:cartzy_app/features/home/presentation/views/home_view.dart';
import 'package:cartzy_app/features/product/presentation/views/product_category_view.dart';
import 'package:cartzy_app/features/product/presentation/views/product_details_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeView.id,
      routes: {
        ProductCategoryView.id: (context) => ProductCategoryView(),
        HomeView.id: (context) => HomeView(),
        SignupView.id: (context) => SignupView(),
        LoginView.id: (context) => LoginView(),
        ProductDetailsView.id: (context) => ProductDetailsView(),
        CartView.id : (context) => CartView(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFEBEBEB),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Color(0xFFEBEBEB),
      ),
    );
  }
}
