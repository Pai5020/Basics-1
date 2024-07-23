import '../models/cart_item.dart';

class CartState {
  final List<CartItem> items;

  CartState({this.items = const []});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartState &&
          runtimeType == other.runtimeType &&
          items == other.items;

  @override
  int get hashCode => items.hashCode;
}
