import 'package:ecommerceapp/widgets/drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/product_overview.dart';
import '../widgets/cart_badge.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  bool favStaus = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text(
          "My Shop",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
        ),
        actions: [
          PopupMenuButton(
              color: Colors.lightBlue,
              icon: const Icon(
                Icons.more_vert,
                color: Colors.blue,
              ),
              onSelected: (bool val) {
                setState(() {
                  favStaus = val;
                });
              },
              itemBuilder: (c) {
                return [
                  const PopupMenuItem(
                    child: Text(
                      "Show Only Favourite",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    value: true,
                  ),
                  const PopupMenuItem(
                    child: Text(
                      "Show all",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    value: false,
                  ),
                ];
              }),
          const CartBadge(),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      drawer: const DrawerBuilder(),
      body: ProductOverView(favStatus: favStaus),
    );
  }
}
