import 'package:ecommerceapp/screens/dash.dart';
import 'package:ecommerceapp/screens/manage_products.dart';
import 'package:ecommerceapp/screens/order_screen.dart';
import 'package:flutter/material.dart';

class DrawerBuilder extends StatelessWidget {
  const DrawerBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue,
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => const Dash()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: const [
                Icon(
                  Icons.shop_2,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'My Shop',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 25),
                )
              ]),
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const OrderScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: const [
                Icon(
                  Icons.add_shopping_cart_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'My Orders',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 25),
                )
              ]),
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();

              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const ManageProducts()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: const [
                Icon(
                  Icons.manage_accounts,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Manage Products',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 25),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
