import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String productDescription;

  const ProductDescription({super.key, required this.productDescription});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.0,
      children: [
        Text(
          'Description',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          productDescription,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
