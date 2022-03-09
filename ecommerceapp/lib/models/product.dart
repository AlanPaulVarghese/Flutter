class Product {
  final String id;
  final String title;
  final String des;
  final double price;
  final String url;
  bool isFav;

  Product(
      {required this.des,
      required this.id,
      required this.isFav,
      required this.price,
      required this.title,
      required this.url});
}
