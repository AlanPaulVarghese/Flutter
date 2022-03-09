import 'package:ecommerceapp/models/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/dash.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: const MaterialApp(
        home: Dash(),
      ),
    );
  }
}
