import 'package:flutter/material.dart';
import 'package:minimalshop/models/shop.dart';
import 'package:minimalshop/pages/cart_page.dart';
import 'package:minimalshop/pages/intro_page.dart';
import 'package:minimalshop/pages/shop_page.dart';
import 'package:minimalshop/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const MyCart()
      },
    );
  }
}
