import 'package:ecommerceapp/models/cart.dart';
import 'package:flutter/cupertino.dart';

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

  void addOrder(
      {required String id,
      required DateTime dateTime,
      required List<Cart> items,
      required double total}) {
    orders.add(Order(date: dateTime, id: id, items: items, total: total));
    notifyListeners();
  }
}
