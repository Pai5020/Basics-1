// screens/dashboard.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/productProvider.dart';
import '../providers/cartProvider.dart';
import '../product_model/cartItem.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0), // Add space after AppBar
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.products.map((product) {
              bool isInCart = cartProvider.isInCart(product.name);
              int quantity = cartProvider.getQuantity(product.name);
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(product.imageUrl, fit: BoxFit.cover),
                    ),
                    SizedBox(height: 8),
                    Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('${product.price}'),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        cartProvider.addItem(CartItem(
                          name: product.name,
                          price: product.price,
                          imageUrl: product.imageUrl,
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isInCart ? Colors.green : Colors.blue,
                      ),
                      child: Text(
                        isInCart ? 'Remove from Cart' : 'Add to Cart',
                        style: TextStyle(
                          color: isInCart
                              ? Colors.white
                              : Colors.black, // Change text color
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: isInCart && quantity > 1
                              ? () =>
                                  cartProvider.decrementQuantity(product.name)
                              : null,
                        ),
                        Text(quantity.toString()),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () =>
                              cartProvider.incrementQuantity(product.name),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
