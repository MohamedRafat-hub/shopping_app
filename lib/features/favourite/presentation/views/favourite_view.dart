import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/custom_material_button.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  static const String id = 'FavouriteView';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My favourite',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: EmptyFavouriteViewBody(),
    );
  }
}

class EmptyFavouriteViewBody extends StatelessWidget {
  const EmptyFavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/fac_view_icon.png'),
          const SizedBox(
            height: 10,
          ),
          Text(
            'There are no products in your',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black , fontSize: 18 , fontWeight: FontWeight.w300),
          ),

          Text(
            'favourite list',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black , fontSize: 18 , fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

class InfoFavouriteViewBody extends StatelessWidget {
  const InfoFavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomMaterialButton(onPressed: (){},text: 'Add to cart', color: Colors.black, textColor: Colors.white),
      ],
    );
  }
}

