import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/product_component.dart';
import '../../managers/products_category_cubit/get_products_by_category_cubit.dart';
import '../product_details_view.dart';

class ProductCategoryViewBody extends StatelessWidget {
  const ProductCategoryViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: BlocBuilder<GetProductsCategoryCubit, GetProductsByCategoryState>(
        builder: (context, state) {
          if (state is GetProductsByCategorySuccess) {
            return GridView.builder(
                itemCount: state.products.length,
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
                      child: ProductComponent(
                        productModel: state.products[index],
                      ));
                });
          } else if (state is GetProductsByCategoryLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetProductsCategoryFailure) {
            return Text(
              '${state.errorMessage}',
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.w500),
            );
          } else {
            return Text('There was an error , Please try later');
          }
        },
      ),
    );
  }
}
