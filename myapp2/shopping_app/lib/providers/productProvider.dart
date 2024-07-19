// providers/product_provider.dart
import 'package:flutter/material.dart';
import '../../product_model/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
        name: 'Kurti ',
        price: 29.99,
        imageUrl:
            'https://img.freepik.com/free-photo/young-woman-beautiful-yellow-dress_1303-17537.jpg'),
    Product(
        name: 'Shirt',
        price: 59.99,
        imageUrl:
            'https://mir-s3-cdn-cf.behance.net/project_modules/max_3840/68993788541761.5dd95dc31b698.jpg'),
    Product(
        name: 'ALine Dress',
        price: 19.99,
        imageUrl:
            'https://img.freepik.com/free-photo/young-woman-getting-ready-wedding_23-2149329163.jpg?size=626&ext=jpg&ga=GA1.1.610102206.1717945238&semt=ais_user'),
  ];

  List<Product> get products => _products;
}
