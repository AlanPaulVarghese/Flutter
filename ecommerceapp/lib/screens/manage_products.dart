import 'package:ecommerceapp/models/products.dart';
import 'package:ecommerceapp/screens/new_product_form.dart';
import 'package:ecommerceapp/widgets/manage_product_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          "My Products",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
        ),
      ),
      body: p.data.isEmpty
          ? const Center(
              child: Text("No Products To Display"),
            )
          : ListView.builder(
              itemBuilder: (ctx, i) {
                return ManageProductBuilder(product: p.data[i]);
              },
              itemCount: p.data.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const NewProductForm()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
