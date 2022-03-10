import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/models/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductOverViewBuilder extends StatelessWidget {
  final Product product;
  const ProductOverViewBuilder({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.url,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
          title: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(product.title, overflow: TextOverflow.ellipsis)),
          backgroundColor: Colors.black54,
          leading: IconButton(
              onPressed: () {
                Provider.of<Carts>(context, listen: false).addCartItem(
                  id: DateTime.now().toString(),
                  title: product.title,
                  prodId: product.id,
                  price: product.price,
                );
              },
              icon: const Icon(Icons.shopping_cart)),
          trailing: Consumer<Products>(
            builder: (ctx, p, _) => IconButton(
                onPressed: () {
                  p.toggleFav(product.id);
                },
                icon: !product.isFav
                    ? const Icon(Icons.favorite_border)
                    : const Icon(
                        Icons.favorite,
                        color: Colors.blue,
                      )),
          )),
    );
  }
}
