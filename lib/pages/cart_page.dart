import 'package:flutter/material.dart';
import 'package:minimalshop/components/my_button.dart';
import 'package:minimalshop/models/product.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../models/shop.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  // remove product from cart
  void removeFromCart(BuildContext context, Product product) {
    // // alert the user with a dialog box
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text('Remove this item from your cart?'),
          actions: [
            // cancel
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),

            // yes
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<Shop>().removeFromCart(product);
              },
              child: const Text('Yes'),
            )
          ],
        );
      },
    );
  }

  // payment method
  void pay(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          content: Text('Payment is done 💲💲💲'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('C A R T'),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? SizedBox(
                    child: Image.network(
                        'https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExaHZ4dndmNTM3ZnJkY2JhdTN6ems3NDVheHNnbnQzYW5tNDF4eXdyaiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/giXLnhxp60zEEIkq8K/giphy-downsized-large.gif'),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // get each item from cart
                      final product = cart[index];

                      // return cart tile
                      return ListTile(
                        title: Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(product.price.toStringAsFixed(2)),
                        trailing: IconButton(
                            onPressed: () => removeFromCart(context, product),
                            icon: const Icon(Icons.remove)),
                      );
                    },
                  ),
          ),

          // pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
                child: cart.isNotEmpty
                    ? MyButton(
                        onTap: () => pay(context), child: const Text('Pay Now'))
                    : Container()),
          )
        ],
      ),
    );
  }
}
