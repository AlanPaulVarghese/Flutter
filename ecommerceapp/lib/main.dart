import 'package:ecommerceapp/models/order.dart';
import 'package:ecommerceapp/models/products.dart';
import 'package:ecommerceapp/screens/dash.dart';
import 'package:ecommerceapp/screens/user_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/dataloader.dart';
import './models/cart.dart';
import './models/auth.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (ctx) => Auth()),
      ChangeNotifierProvider(
        create: (ctx) => Products(),
      ),
      ChangeNotifierProvider(create: (ctx) => Carts()),
      ChangeNotifierProvider(create: (ctx) => Orders()),
    ], child: const MaterialAppHolder());
  }
}

class MaterialAppHolder extends StatelessWidget {
  const MaterialAppHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false, home:auth.isAuth?DataLoader(
        future: Provider.of<Products>(context, listen: false).loadData(),
        child:const Dash(),
      ): const LoginScreen()));
  }
}

/*





*/
