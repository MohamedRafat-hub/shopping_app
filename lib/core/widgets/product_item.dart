import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.image});

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
          Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/icons/favourite_icon.png')),
          Expanded(
              child: (image != null && image!.isNotEmpty)
                  ? CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/product_image.png'),
              )
                  : Image.asset('assets/images/product_image.png')),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}