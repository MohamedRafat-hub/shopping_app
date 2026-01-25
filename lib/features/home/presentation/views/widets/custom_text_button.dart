import 'package:cartzy_app/features/product/presentation/views/product_category_view.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.buttonName,
  });

  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, ProductCategoryView.id);
        },
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.black))),
        child: Text(
          buttonName,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
        ));
  }
}