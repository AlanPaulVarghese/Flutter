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
    final id = DateTime.now().toString();
    final url = Uri.parse(
        "https://ecommerceapp1122-default-rtdb.firebaseio.com/products.json");
    await http.post(url,
        body: json.encode({
          'title': product.title,
          'price': product.price,
          'des': product.des,
          'isFav': product.isFav,
          'imgUrl': product.url,
          'id': id
        }));
    Product newProduct = Product(
        des: product.des,
        id: id,
        isFav: product.isFav,
        price: product.price,
        title: product.title,
        url: product.url);

    _data.add(newProduct);
    notifyListeners();
  }

  void editProduct(Product product) {
    final temp = _data.firstWhere((element) => element.id == product.id);
    _data.remove(temp);
    _data.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _data.remove(product);
    notifyListeners();
  }

  Future<void> loadData() async {
    final url = Uri.parse(
        "https://ecommerceapp1122-default-rtdb.firebaseio.com/products.json");
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
      notifyListeners();
    }
  }

  
  Product getProduct(String id) {
    final p = _data.firstWhere((element) => element.id == id);
    return p;
  }
}
