
import 'package:cartzy_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({super.key,  this.productModel});
  final ProductModel? productModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: ProductItem(image: productModel?.images?[0] ?? 'assets/images/product_image.png',)),
        Text(
          productModel?.title ?? 'No title',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          'EGP ${productModel?.price}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, this.image
  });

  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Align(alignment : Alignment.topRight,child: Image.asset('assets/icons/favourite_icon.png')),
          Expanded(child: Image.network(image!)),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}