import 'package:expensemanger/models/setting.dart';
import 'package:flutter/material.dart';
import './database.dart';

class Money {
  final int id;
  final String title;
  final double val;
  final DateTime date;
  final bool moneyType; //true-expense,false-income
  final int cat;
  Money(
      {required this.moneyType,
      required this.title,
      required this.val,
      required this.cat,
      required this.id,
      required this.date});
}

class MoneyData extends ChangeNotifier {
  Map<int, String> expenseCat = {
    1: "Rent",
    2: "Transportation",
    3: "Groceries",
    4: "Home and utilities",
    5: "Insurance",
    12: "Bills & emis",
    7: "Education",
    8: "Health and personal care",
    9: "Shopping and entertainment",
    10: "Food and dining",
    11: "Memberships",
    6: "Others"
  };

  Map<int, String> incomeCat = {
    1: "Salary",
    2: "Interest",
    3: "Dividend",
    4: "Rental",
    5: "Capital Gain",
    6: "Others",
  };

  Map<int, Color> expenseColor = {
    1: Colors.amber,
    2: Colors.blue,
    3: Colors.brown,
    4: Colors.cyan,
    5: Colors.deepOrange,
    6: Colors.deepPurple,
    7: Colors.green,
    8: Colors.indigo,
    9: Colors.lime,
    10: Colors.teal,
    11: Colors.red
  };

  Map<int, Color> incomeColor = {
    1: Colors.amber,
    2: Colors.blue,
    3: Colors.brown,
    4: Colors.cyan,
    5: Colors.deepOrange,
    6: Colors.deepPurple,
  };

  double getExpenseCatVal(int cat) {
    double temp = 0.0;
    for (var element in data) {
      if (element.moneyType == true) {
        if (element.cat == cat) {
          temp += element.val;
        }
      }
    }
    return temp;
  }

  double getIncomeCatVal(int cat) {
    double temp = 0.0;
    for (var element in data) {
      if (element.moneyType == false) {
        if (element.cat == cat) {
          temp += element.val;
        }
      }
    }
    return temp;
  }

  List<PopupMenuItem> get expenseCatMenu {
    List<PopupMenuItem> temp = [];
    expenseCat.forEach((key, value) {
      temp.add(PopupMenuItem(
        child: Text(value),
        value: key,
      ));
    });
    return temp;
  }

  List<PopupMenuItem> get incomeCatMenu {
    List<PopupMenuItem> temp = [];
    incomeCat.forEach((key, value) {
      temp.add(PopupMenuItem(
        child: Text(value),
        value: key,
      ));
    });
    return temp;
  }

  List<Money> data = [];

  void filterByNameAsc() {
    data.sort((a, b) => a.title.toString().compareTo(b.title.toString()));
    notifyListeners();
  }

  void filterByNameDesc() {
    data.sort((a, b) => a.title.toString().compareTo(b.title.toString()));
    data = data.reversed.toList();
    notifyListeners();
  }

  void filterByDateAsc() {
    data.sort((a, b) => a.date.compareTo(b.date));
    notifyListeners();
  }

  void filterByDateDesc() {
    data.sort((a, b) => a.date.compareTo(b.date));
    data = data.reversed.toList();
    notifyListeners();
  }

  void filterByPriceAsc() {
    data.sort((a, b) => a.val.compareTo(b.val));
    notifyListeners();
  }

  void filterByPriceDesc() {
    data.sort((a, b) => a.val.compareTo(b.val));
    data = data.reversed.toList();
    notifyListeners();
  }

  double get expenseTotal {
    double temp = 0.0;
    for (var d in data) {
      if (d.moneyType) {
        temp += d.val;
      }
    }
    return temp;
  }

  double get incomeTotal {
    double temp = 0.0;
    for (var d in data) {
      if (!d.moneyType) {
        temp += d.val;
      }
    }
    return temp;
  }

  void fetchData() async {
    final temp = await MoneyDatabase.read();
    for (var e in temp) {
      data.add(Money(
          date: DateTime.parse(e['date'].toString()),
          id: int.parse(e['id'].toString()),
          moneyType: e['moneyType'] == 1 ? true : false,
          title: e['title'].toString(),
          val: double.parse(e['value'].toString()),
          cat: int.parse(e['cat'].toString())));
    }
    notifyListeners();
  }

  void addData(String title, double val, bool moneyType, int cat,
      DateTime dateTime) async {
    Map<String, Object> datab = {
      'title': title,
      'value': val,
      'moneyType': moneyType ? 1 : 0,
      'cat': cat,
      'date': dateTime.toIso8601String()
    };
    final res = await MoneyDatabase.create(datab);
    data.add(Money(
        moneyType: moneyType,
        title: title,
        val: val,
        cat: cat,
        id: res,
        date: dateTime));
    notifyListeners();
  }

  void delete(int id) async {
    final res = await MoneyDatabase.delete(id);
    data.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  bool darkMode = Settings.getDarkMode() ?? false;

  void setDarkMode(bool d) {
    darkMode = d;
    notifyListeners();
  }

  void rebuldApp() {
    notifyListeners();
  }
}
