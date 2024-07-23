import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.products.map((product) {
              return BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  final cartBloc = context.read<CartBloc>();
                  bool isInCart = cartBloc.isInCart(product.name);
                  int quantity = cartBloc.getQuantity(product.name);

                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(product.imageUrl,
                              fit: BoxFit.cover),
                        ),
                        SizedBox(height: 8),
                        Text(
                          product.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text('\$${product.price}'),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            cartBloc.add(AddItem(CartItem(
                              name: product.name,
                              price: product.price,
                              imageUrl: product.imageUrl,
                            )));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isInCart ? Colors.green : Colors.blue,
                          ),
                          child: Text(
                            isInCart ? 'Remove from Cart' : 'Add to Cart',
                            style: TextStyle(
                              color: isInCart ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: isInCart && quantity > 1
                                  ? () => cartBloc
                                      .add(DecrementQuantity(product.name))
                                  : null,
                            ),
                            Text(quantity.toString()),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () =>
                                  cartBloc.add(IncrementQuantity(product.name)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
