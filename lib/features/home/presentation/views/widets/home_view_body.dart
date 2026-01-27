import 'package:cartzy_app/features/home/data/models/product_model.dart';
import 'package:cartzy_app/features/home/presentation/managers/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:cartzy_app/features/home/presentation/managers/get_all_products_Cubit/get_all_products_cubit.dart';
import 'package:cartzy_app/features/home/presentation/views/widets/custom_text_button.dart';
import 'package:cartzy_app/features/home/presentation/views/widets/product_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi !,',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Let’s start your day',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
                child: GetAllCategories(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            CustomGridView(),
          ],
        ),
      ),
    );
  }
}

class GetAllCategories extends StatelessWidget {
  const GetAllCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
      builder: (context, state) {
        if (state is GetAllCategoriesSuccess) {
          return ListView.builder(
              itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CustomTextButton(
                      buttonName: state.categories[index].name.toString()),
                );
              });
        } else if (state is GetAllCategoriesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetAllCategoriesFailure) {
          return Center(
              child: Text(
            '${state.errorMessage}',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500 ,fontSize: 16),
          ));
        }
        else
          {
            return Center(
                child: Text(
                  'There was an error please try again',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500 ,fontSize: 16),
                ));
          }

      },
    );
  }
}

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
            }, childCount: 20),
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
