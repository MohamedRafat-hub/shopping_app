import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const String id = 'CartView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: CartInfo(),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('assets/images/cart_image.png'));
  }
}


class CartInfo extends StatelessWidget {
  const CartInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Row(
        children: [
          Image.asset('assets/images/product_image.png'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('T-shirt oversize'),
                  IconButton(onPressed: (){}, icon: Image.asset('assets/icons/cancel_icon.png')),
                ],
              ),
              Row(children: [
                Text('EGP 199'),
                IconButton(onPressed: (){}, icon: Image.asset('assets/icons/minus_icon.png')),
                Text('1'),
                IconButton(onPressed: (){}, icon: Image.asset('assets/icons/plus_icon.png')),
              ],),
            ],
          ),
        ],
      ),
    );
  }
}

