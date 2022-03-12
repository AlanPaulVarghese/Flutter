import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/material.dart';
import '../models/products.dart';

class ManageProductBuilder extends StatelessWidget {
  final Product product;
  const ManageProductBuilder({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(product.url),
        ),
        title: Text(product.title),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
