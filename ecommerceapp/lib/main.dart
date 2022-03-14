import 'package:ecommerceapp/models/order.dart';
import 'package:ecommerceapp/models/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/dash.dart';
import './models/cart.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(create: (ctx) => Carts()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Dash(),
      ),
    );
  }
}

/*

class DataLoader extends StatelessWidget {
  const DataLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Products().loadData(),
      builder: (ctx, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snap.connectionState == ConnectionState.done) {
          print(snap.data);
          return const Dash();
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
*/