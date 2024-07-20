// providers/product_provider.dart
import 'package:flutter/material.dart';
import '../../product_model/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
        name: 'Kurti ',
        price: 29.99,
        imageUrl:
            'https://images.unsplash.com/photo-1667665970118-f55705003914?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8a3VydGl8ZW58MHx8MHx8fDA%3D'),
    Product(
        name: 'Shirt',
        price: 59.99,
        imageUrl:
            'https://mir-s3-cdn-cf.behance.net/project_modules/max_3840/68993788541761.5dd95dc31b698.jpg'),
    Product(
        name: 'ALine Dress',
        price: 19.99,
        imageUrl:
            'https://images.pexels.com/photos/18172215/pexels-photo-18172215/free-photo-of-model-in-red-a-line-midi-dress-in-front-of-an-old-wooden-door.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  ];

  List<Product> get products => _products;
}
