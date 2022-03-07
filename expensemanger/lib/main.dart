import 'package:expensemanger/models/setting.dart';
import 'package:flutter/material.dart';
import './screens/dash.dart';
import 'package:provider/provider.dart';
import './models/money.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Settings.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => MoneyData(),
      child: const MaterialApp(
        home: Dash(),
      ),
    );
  }
}
