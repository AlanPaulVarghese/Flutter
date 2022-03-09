import 'package:flutter/material.dart';
import '../widgets/product_overview.dart';

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
        centerTitle: true,
        title: const Text("My Shop"),
        actions: [
          PopupMenuButton(
              color: Colors.lightBlue,
              icon: const Icon(Icons.more_vert),
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
              })
        ],
      ),
      body: ProductOverView(favStatus: favStaus),
    );
  }
}
