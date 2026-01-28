import 'package:cartzy_app/features/product/presentation/managers/products_category_cubit/get_products_by_category_cubit.dart';
import 'package:cartzy_app/features/product/presentation/views/product_category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextButton extends StatelessWidget {
   CustomTextButton({
    super.key,
    required this.buttonName,
    this.onPressed
  });

  final String buttonName;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
        // onPressed: () {
        //   BlocProvider.of<GetProductsCategoryCubit>(context).getProductsByCategory();
        //   Navigator.pushNamed(context, ProductCategoryView.id ,arguments: buttonName);
        // },
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