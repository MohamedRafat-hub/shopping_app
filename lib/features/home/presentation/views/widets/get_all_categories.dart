import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../managers/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'custom_text_button.dart';

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
