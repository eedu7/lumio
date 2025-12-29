import 'package:flutter/material.dart';
import 'package:frontend/features/cart/presentations/widgets/cart_item.dart';
import 'package:frontend/features/home/presentations/widgets/product_price_bar.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leadingWidth: 72,
        // Room for the custom button
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.w900, // Heavier weight for premium look
            color: Colors.black87,
            fontSize: 20,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Center(
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {}, // Action like "Clear Cart" or "Options"
              icon: const Icon(Icons.more_horiz_rounded, color: Colors.black87),
            ),
          ),
        ],
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
