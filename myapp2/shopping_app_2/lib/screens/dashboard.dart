import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';
import '../models/cart_item.dart';

class DashboardScreen extends StatelessWidget {
  final List<CartItem> products = [
    CartItem(
        name: 'Product 1',
        price: 10.0,
        imageUrl: 'https://via.placeholder.com/100'),
    CartItem(
        name: 'Product 2',
        price: 20.0,
        imageUrl: 'https://via.placeholder.com/100'),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: products.map((product) {
                  final isInCart =
                      context.read<CartBloc>().isInCart(product.name);
                  final quantity =
                      context.read<CartBloc>().getQuantity(product.name);

                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          product.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Text(product.name),
                        Text('\$${product.price.toStringAsFixed(2)}'),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isInCart ? Colors.green : Colors.blue,
                          ),
                          onPressed: () {
                            if (isInCart) {
                              context
                                  .read<CartBloc>()
                                  .add(RemoveItem(product.name));
                            } else {
                              context.read<CartBloc>().add(AddItem(product));
                            }
                          },
                          child: Text(
                            isInCart ? 'Remove from Cart' : 'Add to Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: quantity > 1
                                  ? () {
                                      context
                                          .read<CartBloc>()
                                          .add(DecrementQuantity(product.name));
                                    }
                                  : null,
                            ),
                            Text(quantity.toString()),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(IncrementQuantity(product.name));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
