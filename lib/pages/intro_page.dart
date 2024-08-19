import 'package:flutter/material.dart';
import 'package:minimalshop/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            // title
            const Text(
              'Minimal Shop',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            const SizedBox(height: 6),

            // subtitle
            Text(
              'Premium Quality Products',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(height: 25),

            // button
            MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: const Icon(
                  Icons.arrow_forward,
                ))
          ],
        ),
      ),
    );
  }
}
