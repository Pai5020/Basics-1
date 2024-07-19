import 'package:flutter/material.dart';
import '../product_model/cartItem.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    var existingItem = _items.firstWhere(
      (i) => i.name == item.name,
      orElse: () => CartItem(name: '', price: 0.0, imageUrl: ''),
    );
    if (existingItem.name.isEmpty) {
      _items.add(item);
    } else {
      _items.remove(existingItem);
    }
    notifyListeners();
  }

  bool isInCart(String name) {
    return _items.any((item) => item.name == name);
  }
}
