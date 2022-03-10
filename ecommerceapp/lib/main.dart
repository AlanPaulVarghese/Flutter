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
        ChangeNotifierProvider(create: (ctx) => Carts())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Dash(),
      ),
    );
  }
}
