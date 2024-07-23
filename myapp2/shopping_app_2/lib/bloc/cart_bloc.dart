// bloc/cart_bloc.dart
import 'package:bloc/bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';
import '../models/cart_item.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddItem>((event, emit) {
      List<CartItem> updatedItems = List.from(state.items);
      var existingItem = updatedItems.firstWhere(
        (item) => item.name == event.item.name,
        orElse: () => CartItem(name: '', price: 0.0, imageUrl: '', quantity: 0),
      );
      if (existingItem.name.isEmpty) {
        updatedItems.add(event.item);
      } else {
        updatedItems.remove(existingItem);
      }
      emit(CartState(items: updatedItems));
    });

    on<RemoveItem>((event, emit) {
      List<CartItem> updatedItems = List.from(state.items)
        ..removeWhere((item) => item.name == event.itemName);
      emit(CartState(items: updatedItems));
    });

    on<IncrementQuantity>((event, emit) {
      List<CartItem> updatedItems = state.items.map((item) {
        if (item.name == event.itemName) {
          return CartItem(
            name: item.name,
            price: item.price,
            imageUrl: item.imageUrl,
            quantity: item.quantity + 1,
          );
        }
        return item;
      }).toList();
      emit(CartState(items: updatedItems));
    });

    on<DecrementQuantity>((event, emit) {
      List<CartItem> updatedItems = state.items.map((item) {
        if (item.name == event.itemName && item.quantity > 1) {
          return CartItem(
            name: item.name,
            price: item.price,
            imageUrl: item.imageUrl,
            quantity: item.quantity - 1,
          );
        }
        return item;
      }).toList();
      emit(CartState(items: updatedItems));
    });
  }

  bool isInCart(String name) {
    return state.items.any((item) => item.name == name);
  }

  int getQuantity(String name) {
    var existingItem = state.items.firstWhere(
      (item) => item.name == name,
      orElse: () => CartItem(name: '', price: 0.0, imageUrl: '', quantity: 0),
    );
    return existingItem.quantity;
  }
}
