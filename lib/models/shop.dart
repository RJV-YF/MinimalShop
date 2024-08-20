import 'package:flutter/material.dart';
import 'package:minimalshop/models/product.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price: 99.99,
      description:
          'Item description. More description about the product and how it is going to look like',
    ),
    Product(
      name: "Product 2",
      price: 99.99,
      description: 'Item description',
    ),
    Product(
      name: "Product 3",
      price: 99.99,
      description: 'Item description',
    ),
    Product(
      name: "Product 4",
      price: 99.99,
      description: 'Item description',
    ),
    Product(
      name: "Product 5",
      price: 99.99,
      description: 'Item description',
    ),
  ];
  // user cart
  final List<Product> _cart = [];
  // get product list
  List<Product> get shop => _shop;
  // get user cart
  List<Product> get cart => _cart;

  // add items to cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  // remove items from cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
