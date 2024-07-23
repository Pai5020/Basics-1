import '../models/cart_item.dart';

abstract class CartEvent {}

class AddItem extends CartEvent {
  final CartItem item;

  AddItem(this.item);
}

class RemoveItem extends CartEvent {
  final String itemName;

  RemoveItem(this.itemName);
}

class IncrementQuantity extends CartEvent {
  final String itemName;

  IncrementQuantity(this.itemName);
}

class DecrementQuantity extends CartEvent {
  final String itemName;

  DecrementQuantity(this.itemName);
}
