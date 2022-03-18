import 'package:ecommerceapp/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Order {
  final String id;
  final DateTime date;
  final List<Cart> items;
  final double total;
  Order(
      {required this.date,
      required this.id,
      required this.items,
      required this.total});
}

class Orders with ChangeNotifier {
  final List<Order> orders = [];
  Future<void> addOrder(
      {required String id,
      required DateTime dateTime,
      required List<Cart> items,
      required double total}) async {
    final url = Uri.parse(
        "https://ecommerceapp1122-default-rtdb.firebaseio.com/oders.json");
    final res = await http.post(url,
        body: json.encode({
          'date': dateTime.toIso8601String(),
          'total': total,
          'items': items
              .map((e) =>
                  {'id': e.id, 'pid': e.prodId, 'qty': e.qty, 'total': e.total})
              .toList()
        }));
    var id = json.decode(res.body)['name'];
    orders.add(Order(date: dateTime, id: id, items: items, total: total));
    notifyListeners();
  }

  Future<void> loadData() async {
    orders.clear();
    final url = Uri.parse(
        "https://ecommerceapp1122-default-rtdb.firebaseio.com/oders.json");
    final res = await http.get(url);
    final conRes = json.decode(res.body);
    final convertedData = Map<String, dynamic>.from(conRes);
    convertedData.forEach((key, value) {
      final temp = value['items'] as List<dynamic>;
      final List<Cart> tempItems = [];
      for (var element in temp) {
        tempItems.add(Cart(
            prodId: element['pid'],
            id: element['id'],
            qty: element['qty'],
            total: element['total']));
      }
      
      orders.add(Order(
          date: DateTime.parse(value['date']),
          id: key,
          items: tempItems,
          total: value['total']));
    });
  }
}
