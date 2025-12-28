import 'package:flutter/material.dart';

class ProductHeading extends StatefulWidget {
  const ProductHeading({super.key});

  @override
  State<ProductHeading> createState() => _ProductHeadingState();
}

class _ProductHeadingState extends State<ProductHeading> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Short Cape Jacket",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(backgroundColor: Colors.grey.shade200),
          onPressed: () {
            // TODO: Add to wishlist or favorite
            setState(() {
              _isFavorite = !_isFavorite;
            });
          },
          icon: Icon(
            _isFavorite ? Icons.favorite : Icons.favorite_outline,
            color: _isFavorite ? Colors.red : null,
          ),
        ),
      ],
    );
  }
}
