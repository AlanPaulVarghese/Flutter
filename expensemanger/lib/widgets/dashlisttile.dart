import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/money.dart';

class DashListTile extends StatelessWidget {
  final Money data;
  const DashListTile({Key? key, required this.data}) : super(key: key);

  TextStyle DarkModeStyle() {
    return const TextStyle(color: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<MoneyData>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        color: p.darkMode ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: CircleAvatar(
            child: Text(data.title[0]),
            backgroundColor: data.moneyType
                ? p.expenseColor[data.cat]
                : p.incomeColor[data.cat],
          ),
          title: Text(
            data.title,
            style: p.darkMode ? DarkModeStyle() : const TextStyle(),
          ),
          subtitle: data.moneyType
              ? Text(
                  Provider.of<MoneyData>(context, listen: false)
                      .expenseCat[data.cat]
                      .toString(),
                  style: p.darkMode ? DarkModeStyle() : const TextStyle(),
                )
              : Text(
                  Provider.of<MoneyData>(context, listen: false)
                      .incomeCat[data.cat]
                      .toString(),
                  style: p.darkMode ? DarkModeStyle() : const TextStyle(),
                ),
          trailing: Text(data.val.toString(),
              style: data.moneyType
                  ? const TextStyle(color: Colors.red)
                  : const TextStyle(color: Colors.green)),
        ),
      ),
    );
  }
}
