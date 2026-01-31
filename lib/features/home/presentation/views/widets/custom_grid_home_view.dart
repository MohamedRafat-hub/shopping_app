import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/product_component.dart';
import '../../managers/get_all_products_Cubit/get_all_products_cubit.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        if (state is GetAllProductsSuccess) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ProductComponent(
                productModel: state.products[index],
              );
            }, childCount: state.products.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
          );
        } else if (state is GetAllProductsLoading) {
          return SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()));
        } else if (state is GetAllProductsFailure) {
          return SliverToBoxAdapter(
              child: Center(
                  child: Text(
                    state.errorMessage,
                    style: TextStyle(
                        color: Colors.red, fontSize: 16, fontWeight: FontWeight.w500),
                  )));
        } else {
          return SliverToBoxAdapter(
              child:
              Center(child: Text('There was an error , please try later')));
        }
      },
    );
  }
}