import 'package:flutter/material.dart';
import 'package:frontend/features/cart/presentations/widgets/cart_item.dart';
import 'package:frontend/features/home/presentations/widgets/product_price_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: 3, // Example count
                itemBuilder: (context, index) => const CartItem(),
              ),
            ),
            ProductPriceBar(
              buttonLabel: 'Checkout',
              icon: Icons.arrow_forward_rounded,
              onPressed: () {
                // Navigate to checkout
              },
            ),
          ],
        ),
      ),
    );
  }
}
