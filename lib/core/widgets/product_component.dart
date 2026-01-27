import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartzy_app/core/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../../features/home/data/models/product_model.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: ProductItem(
                image: (productModel.images?.isNotEmpty ?? false)
                    ? productModel.images!.first
                    : null)),
        Text(
          productModel.title ?? 'No title',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          'EGP ${productModel.price}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}


