import 'package:flutter/material.dart';
import '../product_model/cartItem.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    var existingItem = _items.firstWhere(
      (i) => i.name == item.name,
      orElse: () => CartItem(name: '', price: 0.0, imageUrl: '', quantity: 0),
    );
    if (existingItem.name.isEmpty) {
      _items.add(item);
    } else {
      _items.remove(existingItem);
    }
    notifyListeners();
  }

  void incrementQuantity(String name) {
    var existingItem = _items.firstWhere(
      (i) => i.name == name,
      orElse: () => CartItem(name: '', price: 0.0, imageUrl: '', quantity: 0),
    );
    if (existingItem.name.isNotEmpty) {
      existingItem.quantity += 1;
      notifyListeners();
    } else {
      // If item is not in cart, add it with quantity 1
      _items.add(CartItem(name: name, price: 0.0, imageUrl: '', quantity: 1));
    }
  }

  void decrementQuantity(String name) {
    var existingItem = _items.firstWhere(
      (i) => i.name == name,
      orElse: () => CartItem(name: '', price: 0.0, imageUrl: '', quantity: 0),
    );
    if (existingItem.name.isNotEmpty && existingItem.quantity > 1) {
      existingItem.quantity -= 1;
      notifyListeners();
    }
  }

  bool isInCart(String name) {
    return _items.any((item) => item.name == name);
  }

  int getQuantity(String name) {
    var existingItem = _items.firstWhere(
      (i) => i.name == name,
      orElse: () => CartItem(name: '', price: 0.0, imageUrl: '', quantity: 0),
    );
    return existingItem.quantity;
  }
}
