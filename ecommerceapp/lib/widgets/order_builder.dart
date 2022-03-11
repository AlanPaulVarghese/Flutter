import 'dart:math';

import 'package:ecommerceapp/models/products.dart';
import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderBuiler extends StatefulWidget {
  final Order order;
  const OrderBuiler({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderBuiler> createState() => _OrderBuilerState();
}

class _OrderBuilerState extends State<OrderBuiler> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:const BorderSide(color: Colors.white)),
        child: Column(children: [
          ListTile(
            title: Text(widget.order.total.toStringAsFixed(2)),
            subtitle: Text(
                "${widget.order.date.day}/${widget.order.date.month}/${widget.order.date.year}"),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
                icon: expanded
                    ? const Icon(Icons.expand_less)
                    : const Icon(Icons.expand_more)),
          ),
          if (expanded)
            SizedBox(
              height: min(widget.order.items.length * 70.0, 200.0),
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return ListTile(
                    leading: Text(
                      "${i + 1}",
                      style: const TextStyle(color: Colors.blue),
                    ),
                    title: Text(Products()
                        .getProduct(widget.order.items[i].prodId)
                        .title),
                    subtitle:
                        Text(widget.order.items[i].total.toStringAsFixed(2)),
                    trailing: Text("${widget.order.items[i].qty}"),
                  );
                },
                itemCount: widget.order.items.length,
              ),
            )
        ]),
      ),
    );
  }
}
