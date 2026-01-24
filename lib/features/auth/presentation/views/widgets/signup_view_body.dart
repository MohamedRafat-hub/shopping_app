import 'package:cartzy_app/core/utils/custom_material_button.dart';
import 'package:cartzy_app/core/utils/text_form_field_helper.dart';
import 'package:cartzy_app/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

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
            SizedBox(
              height: 20,
            ),
            Text('confirm password'),
            TextFormFieldHelper(
              hint: 'confirm password',
              borderRadius: BorderRadius.circular(10),
              isPassword: true,
            ),
            SizedBox(
              height: 50,
            ),
            CustomMaterialButton(
              text: 'Sign up',
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
                    Navigator.pushReplacementNamed(context, LoginView.id);
                  },
                  child: Text(
                    'Login',
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
