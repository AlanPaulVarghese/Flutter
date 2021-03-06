import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import './product.dart';
import 'dart:convert';

class Products with ChangeNotifier {
  final List<Product> _data = [];

  List<Product> get data => [..._data];

  void toggleFav(String id) {
    Product p = _data.firstWhere((element) => element.id == id);
    p.isFav = !p.isFav;
    notifyListeners();
  }

  List<Product> filteredFavData(bool val) {
    if (val) {
      return _data.where((element) => element.isFav == true).toList();
    }
    return data;
  }

  Future<void> addProduct(Product product) async {
    // final id = DateTime.now().toString();
    final url = Uri.parse(
        "https://ecommerceapp1122-default-rtdb.firebaseio.com/products.json");
    final res = await http.post(url,
        body: json.encode({
          'title': product.title,
          'price': product.price,
          'des': product.des,
          'isFav': product.isFav,
          'imgUrl': product.url,
        }));
    Product newProduct = Product(
        des: product.des,
        id: json.decode(res.body)['name'],
        isFav: product.isFav,
        price: product.price,
        title: product.title,
        url: product.url);

    _data.add(newProduct);
    notifyListeners();
  }

  Future<void> editProduct(Product product) async {
    final url = Uri.parse(
        "https://ecommerceapp1122-default-rtdb.firebaseio.com/products/${product.id}.json");
    await http.patch(url,
        body: json.encode({
          'title': product.title,
          'price': product.price,
          'des': product.des,
          'isFav': product.isFav,
          'imgUrl': product.url,
        }));
    final temp = _data.firstWhere((element) => element.id == product.id);
    _data.remove(temp);
    _data.add(product);
    notifyListeners();
  }

  Future remove(Product product) async {
    try {
      final url = Uri.parse(
          "https://ecommerceapp1122-default-rtdb.firebaseio.com/products/${product.id}.json");
      await http.delete(url);
    } catch (e) {
      return;
    }
    _data.remove(product);
    notifyListeners();
  }

  Future<void> loadData() async {
    final url = Uri.parse(
        "https://ecommerceapp1122-default-rtdb.firebaseio.com/products.json");
    try {
      final res = await http.get(url);
      final conRes = json.decode(res.body);
      if (conRes == null) {
        return;
      } else {
        final convertedData = Map<String, dynamic>.from(conRes);
        convertedData.forEach((key, value) {
          _data.add(Product(
              des: value['des'],
              id: key,
              isFav: value['isFav'],
              price: value['price'],
              title: value['title'],
              url: value['imgUrl']));
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  Product getProduct(String id) {
    final p = _data.firstWhere((element) => element.id == id);
    return p;
  }
}
