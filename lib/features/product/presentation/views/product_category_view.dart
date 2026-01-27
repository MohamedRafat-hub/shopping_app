import 'package:cartzy_app/features/product/presentation/views/widgets/product_category_view_body.dart';
import 'package:flutter/material.dart';


class ProductCategoryView extends StatelessWidget {
  const ProductCategoryView({super.key});

  static const String id = 'ProductCategoryView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${ModalRoute.of(context)!.settings.arguments}',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: ProductCategoryViewBody(),
    );
  }
}

