import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/material.dart';
import '../models/cart.dart';

class CartBuilder extends StatelessWidget {
  final Cart cart;
  final Product product;
  const CartBuilder({Key? key, required this.cart, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(product.url),
        ),
        title: Text(product.title),
        subtitle: Text("quantity:${cart.qty}"),
        trailing: Text("\$${cart.total}"),
      ),
    );
  }
}
