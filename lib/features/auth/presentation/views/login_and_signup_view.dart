import 'package:cartzy_app/core/utils/custom_material_button.dart';
import 'package:cartzy_app/features/auth/presentation/views/login_view.dart';
import 'package:cartzy_app/features/auth/presentation/views/signup_view.dart';
import 'package:flutter/material.dart';

class LoginAndSignup extends StatelessWidget {
  const LoginAndSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.asset('assets/images/hello.png'),
              SizedBox(
                height: 24,
              ),
              Text(
                'Hello!',
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: 100,
              ),
              CustomMaterialButton(
                text: 'SignUp',
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, SignupView.id);
                },
              ),
              SizedBox(
                height: 24,
              ),
              CustomMaterialButton(
                text: 'Login',
                color: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, LoginView.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
