import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const id = 'LoginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: LoginViewBody(),
    );
  }
}



