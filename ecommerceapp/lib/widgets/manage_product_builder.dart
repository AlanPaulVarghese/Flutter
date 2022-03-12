import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/models/products.dart';
import 'package:ecommerceapp/screens/edit_product_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => EditProductForm(product: product)));
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.blue,
                  )),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: const Text("Remove This Product"),
                              content: const Text(
                                  "Are You Sure You Want To Delete This Product"),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Provider.of<Products>(context,
                                              listen: false)
                                          .remove(product);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Yes")),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("No")),
                              ],
                            ));
                  },
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
