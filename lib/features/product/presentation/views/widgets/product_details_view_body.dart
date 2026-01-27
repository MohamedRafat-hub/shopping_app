import 'package:cartzy_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/utils/custom_material_button.dart';
import '../../../../../core/widgets/product_item.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: SingleChildScrollView(
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                )),
            SizedBox(
                height: 300,
                child: ProductItem(
                  image: product.images![0],
                )),
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.title ?? 'No title',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacer(),
                Text(
                  '${product.price} EGP',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ReadMoreText(
             product.description ?? 'No description',
              trimLines: 3,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Read more',
              trimExpandedText: 'Read less',
              style: const TextStyle(fontSize: 14),
              moreStyle: TextStyle(color: Colors.blue),
              lessStyle: TextStyle(color: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CustomMaterialButton(
                  onPressed: () {},
                  text: 'Add to cart',
                  color: Colors.black,
                  textColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}