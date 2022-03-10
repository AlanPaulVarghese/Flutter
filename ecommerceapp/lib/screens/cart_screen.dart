import 'package:ecommerceapp/models/products.dart';
import 'package:ecommerceapp/widgets/cart_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Carts>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          return CartBuilder(
              cart: p.items[i],
              product: Provider.of<Products>(context, listen: false)
                  .getProduct(p.items[i].prodId));
        },
        itemCount: p.items.length,
      ),
    );
  }
}
