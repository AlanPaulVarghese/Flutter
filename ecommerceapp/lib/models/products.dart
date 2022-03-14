import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import './product.dart';
import 'dart:convert';

class Products with ChangeNotifier {
  final List<Product> _data = [
    Product(
        id: 'p1',
        title: 'Red Shirt',
        des: 'A red shirt - it is pretty red!',
        price: 29.99,
        url:
            'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        isFav: false),
    Product(
        id: 'p2',
        title: 'Trousers',
        des: 'A nice pair of trousers.',
        price: 59.99,
        url:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
        isFav: false),
    Product(
        id: 'p3',
        title: 'Yellow Scarf',
        des: 'Warm and cozy - exactly what you need for the winter.',
        price: 19.99,
        url: 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
        isFav: false),
    Product(
        id: 'p4',
        title: 'A Pan',
        des: 'Prepare any meal you want.',
        price: 49.99,
        url:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
        isFav: false),
  ];

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
    final url = Uri.parse(
        "https://ecommerceapp1122-default-rtdb.firebaseio.com/products.json");
    final res = await http.post(url,
        body: json.encode({
          'title': product.title,
          'price': product.price,
          'des': product.des,
          'isFav': product.isFav,
          'imgUrl': product.url
        }));
    var id = json.decode(res.body)['name'];
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

  Product getProduct(String id) {
    return _data.firstWhere((element) => element.id == id);
  }
}
