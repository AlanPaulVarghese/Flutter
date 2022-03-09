import 'package:ecommerceapp/models/products.dart';
import 'package:ecommerceapp/widgets/product_overview_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductOverView extends StatelessWidget {
  final bool favStatus;
  const ProductOverView({Key? key, required this.favStatus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Products>(context);
    return GridView.builder(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemBuilder: (c, i) {
        return ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: ProductOverViewBuilder(
                product: p.filteredFavData(favStatus)[i]));
      },
      itemCount: p.filteredFavData(favStatus).length,
    );
  }
}
