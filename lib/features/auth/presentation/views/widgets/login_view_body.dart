
import 'package:cartzy_app/core/utils/text_form_field_helper.dart';
import 'package:cartzy_app/features/auth/presentation/views/signup_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/custom_material_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          spacing: 3,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email'),
            TextFormFieldHelper(
              hint: 'Email',
              borderRadius: BorderRadius.circular(10),
            ),
            SizedBox(
              height: 20,
            ),
            Text('password'),
            TextFormFieldHelper(
              hint: 'password',
              borderRadius: BorderRadius.circular(10),
              isPassword: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forget password?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.grey,
                      decorationColor: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            CustomMaterialButton(
              text: 'Login',
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? ' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, SignupView.id);
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
