import 'package:ecommerceapp/models/order.dart';
import 'package:ecommerceapp/models/products.dart';
import 'package:ecommerceapp/widgets/cart_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<Carts>(context);
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
          "Cart",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
        ),
      ),
      body: p.items.isEmpty
          ? const Center(
              child: Text("Your Cart Is Empty"),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, i) {
                      return CartBuilder(
                          cart: p.items[i],
                          product: Provider.of<Products>(context, listen: false)
                              .getProduct(p.items[i].prodId));
                    },
                    itemCount: p.items.length,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.white)),
                      color: Colors.greenAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                            Text(
                              p.total.toStringAsFixed(2),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      isloading = true;
                    });
                    await Provider.of<Orders>(context, listen: false)
                        .addOrder(
                            id: DateTime.now().toString(),
                            dateTime: DateTime.now(),
                            items: List.from(p.items),
                            total: p.total)
                        .then((value) => setState(() {
                              isloading = false;
                            }));

                    Provider.of<Carts>(context, listen: false).clear();
                    Navigator.of(context).pop();
                  },
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 100,
                      width: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          color: isloading ? Colors.grey : Colors.blue,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: isloading
                                    ? const CircularProgressIndicator()
                                    : const Text(
                                        "Oder Now",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 30),
                                      ),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
