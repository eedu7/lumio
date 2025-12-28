import 'package:flutter/material.dart';

class ProductPriceBar extends StatelessWidget {
  const ProductPriceBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        spacing: 12.0,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price description', style: theme.textTheme.bodySmall),
              Text('Total Price', style: theme.textTheme.titleLarge),
            ],
          ),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              label: Text('Add to cart'),
              icon: Icon(Icons.add_shopping_cart),
            ),
          ),
        ],
      ),
    );
  }
}
