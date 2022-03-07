import 'package:expensemanger/models/money.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BalanceSheet extends StatelessWidget {
  const BalanceSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<MoneyData>(context, listen: false);
    final colorCheck = Provider.of<MoneyData>(context, listen: false).darkMode
        ? Colors.white
        : Colors.black;
    return Scaffold(
        backgroundColor: Provider.of<MoneyData>(context, listen: false).darkMode
            ? Colors.black
            : Colors.white,
        appBar: AppBar(
          backgroundColor:
              Provider.of<MoneyData>(context, listen: false).darkMode
                  ? Colors.black
                  : Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Balance sheet",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w900),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Text(
                'Statement of financial position',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: colorCheck),
              ),
              const Divider(
                thickness: 8,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "Expenses",
                style: TextStyle(
                  color: colorCheck,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              for (int i = 1; i < p.expenseCat.length + 1; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      p.expenseCat[i].toString(),
                      style: TextStyle(color: colorCheck),
                    ),
                    Text(
                      p.getExpenseCatVal(i).toString(),
                      style: TextStyle(color: colorCheck),
                    )
                  ],
                ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  p.expenseTotal.toString(),
                  style: TextStyle(color: colorCheck),
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "Income",
                style: TextStyle(
                  color: colorCheck,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              for (int i = 1; i < p.incomeCat.length + 1; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      p.incomeCat[i].toString(),
                      style: TextStyle(color: colorCheck),
                    ),
                    Text(
                      p.getIncomeCatVal(i).toString(),
                      style: TextStyle(color: colorCheck),
                    )
                  ],
                ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  p.incomeTotal.toString(),
                  style: TextStyle(color: colorCheck),
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Cash Flow-",
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: colorCheck)),
                  Text((p.incomeTotal - p.expenseTotal).toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: colorCheck)),
                ],
              ),
            ],
          ),
        ));
  }
}
