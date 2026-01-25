import 'package:cartzy_app/features/home/presentation/views/widets/product_component.dart';
import 'package:cartzy_app/features/product/presentation/views/product_details_view.dart';
import 'package:flutter/material.dart';

class ProductCategoryView extends StatelessWidget {
  const ProductCategoryView({super.key});

  static const String id = 'ProductCategoryView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'T-shirts',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: GridView.builder(
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetailsView.id);
                  },
                  child: ProductComponent());
            }),
      ),
    );
  }
}
