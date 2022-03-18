
import 'package:ecommerceapp/widgets/order_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/order.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Orders>(context);
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
            "My Orders",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, i) {
            return OrderBuiler(order: p.orders[i]);
          },
          itemCount: p.orders.length),
);
  }
}

