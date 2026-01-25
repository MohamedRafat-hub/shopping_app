
import 'package:flutter/material.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            // width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Align(alignment : Alignment.topRight,child: Image.asset('assets/icons/favourite_icon.png')),
                Expanded(child: Image.asset('assets/images/product_image.png')),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        Text(
          'T-shirt oversize',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        Text(
          'EGP 199',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}