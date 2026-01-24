import 'package:cartzy_app/features/auth/presentation/views/login_view.dart';
import 'package:cartzy_app/features/auth/presentation/views/signup_view.dart';
import 'package:cartzy_app/features/onboarding/presentation/onboarding_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingView(),
      routes: {
        SignupView.id: (context) => SignupView(),
        LoginView.id: (context) => LoginView(),
      },
    );
  }
}
