import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/money.dart';

class FilterMenu extends StatelessWidget {
  const FilterMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorCheck = Provider.of<MoneyData>(context, listen: false).darkMode
        ? Colors.white
        : Colors.black;
    return PopupMenuButton(
        color: Provider.of<MoneyData>(context, listen: false).darkMode
            ? Colors.black
            : Colors.white,
        onSelected: (val) {
          if (val == 0) {
            Provider.of<MoneyData>(context, listen: false).filterByDateDesc();
            return;
          }
          if (val == 1) {
            Provider.of<MoneyData>(context, listen: false).filterByDateAsc();
            return;
          }
          if (val == 2) {
            Provider.of<MoneyData>(context, listen: false).filterByNameDesc();
            return;
          }
          if (val == 3) {
            Provider.of<MoneyData>(context, listen: false).filterByNameAsc();
            return;
          }
          if (val == 4) {
            Provider.of<MoneyData>(context, listen: false).filterByPriceDesc();
            return;
          }
          if (val == 5) {
            Provider.of<MoneyData>(context, listen: false).filterByPriceAsc();
            return;
          }
        },
        icon: const Icon(Icons.filter_list_alt),
        itemBuilder: (ctx) {
          return [
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sort by Time',
                    style: TextStyle(
                      color: colorCheck,
                    ),
                  ),
                  const Icon(Icons.arrow_downward),
                ],
              ),
              value: 0,
            ),
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sort by Time',
                    style: TextStyle(
                      color: colorCheck,
                    ),
                  ),
                  const Icon(Icons.arrow_upward),
                ],
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sort by Name',
                    style: TextStyle(
                      color: colorCheck,
                    ),
                  ),
                  const Icon(Icons.arrow_downward)
                ],
              ),
              value: 2,
            ),
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sort by Name',
                    style: TextStyle(
                      color: colorCheck,
                    ),
                  ),
                  const Icon(Icons.arrow_upward),
                ],
              ),
              value: 3,
            ),
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sort by Price',
                    style: TextStyle(
                      color: colorCheck,
                    ),
                  ),
                  const Icon(Icons.arrow_downward)
                ],
              ),
              value: 4,
            ),
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sort by Price',
                    style: TextStyle(
                      color: colorCheck,
                    ),
                  ),
                  const Icon(Icons.arrow_upward),
                ],
              ),
              value: 5,
            ),
          ];
        });
  }
}
