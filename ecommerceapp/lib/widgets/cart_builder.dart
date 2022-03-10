import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartBuilder extends StatelessWidget {
  final Cart cart;
  final Product product;
  const CartBuilder({Key? key, required this.cart, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cart.id),
      background: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
        child: const Icon(Icons.delete),
      ),
      onDismissed: (dir) {
        Provider.of<Carts>(context, listen: false).dissmiss(cart.id);
      },
      child: Card(
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
      ),
    );
  }
}
