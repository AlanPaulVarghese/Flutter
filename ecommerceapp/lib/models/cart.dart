import 'package:flutter/cupertino.dart';

class Cart {
  final String id;
  final String title;
  final String prodId;
  double total;
  int qty;
  Cart(
      {required this.prodId,
      required this.id,
      required this.qty,
      required this.title,
      required this.total});
}

class Carts with ChangeNotifier {
  final List<Cart> items = [];

  void addCartItem({
    required String id,
    required String title,
    required String prodId,
    required double price,
  }) {
    bool flag = true;
    for (int i = 0; i < items.length; i++) {
      if (items[i].prodId == prodId) {
        items[i].qty++;
        items[i].total += price;
        flag = false;
        break;
      }
    }
    if (flag) {
      items.add(
          Cart(prodId: prodId, id: id, qty: 1, title: title, total: price));
    }
    notifyListeners();
  }

  int get len => calQty();

  int calQty() {
    int temp = 0;
    for (int i = 0; i < items.length; i++) {
      temp += items[i].qty;
    }
    return temp;
  }
}
