import 'package:flutter/cupertino.dart';

import './product.dart';

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

  void addProduct(Product product) {
    _data.add(product);
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

  Product getProduct(String id) {
    /* for (int i = 0; i < _data.length; i++) {
      if (_data[i].id == id) {
        return _data[i];
      }
    }
    return Product(
      des: '',
      id: '',
      isFav: false,
      price: 0.0,
      title: '',
      url: ''
    );*/
    return _data.firstWhere((element) => element.id == id);
  }
}
