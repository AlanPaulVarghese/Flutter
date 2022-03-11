import 'dart:math';

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
    return Card(
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
              icon: const Icon(Icons.expand_more)),
        ),
        if (expanded)
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemBuilder: (ctx, i) {
                print(
                  min(widget.order.items.length * 50.0, 100.0),
                );

                return ListTile(
                  leading: CircleAvatar(
                    child: Text("${i + 1}"),
                  ),
                );
              },
              itemCount: widget.order.items.length,
            ),
          )
      ]),
    );
  }
}
