import 'package:ecommerceapp/models/cart.dart';
import 'package:flutter/cupertino.dart';

class Order {
  final String id;
  final DateTime date;
  final List<Cart> items;
  Order({required this.date, required this.id, required this.items});
}

class Orders with ChangeNotifier {
  final List<Order> orders = [];

  void addOrder(
      {required String id,
      required DateTime dateTime,
      required List<Cart> items}) {
    orders.add(Order(date: dateTime, id: id, items: items));
    notifyListeners();
  }
}
