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
                child: ProductItem()),
            Row(
              children: [
                Text(
                  'T-shirt oversize',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'EGP 199',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ReadMoreText(
              'Elevate your casual wardrobe with our Classic Red Pullover Hoodie. Crafted with a soft cotton blend for ultimate comfort, this vibrant red hoodie features a kangaroo pocket, adjustable drawstring hood, and ribbed cuffs for a snug fit. The timeless design ensures easy pairing with jeans or joggers for a relaxed yet stylish look, making it a versatile addition to your everyday attire',
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