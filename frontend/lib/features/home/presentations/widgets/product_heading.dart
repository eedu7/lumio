import 'package:flutter/material.dart';

class ProductHeading extends StatefulWidget {
  final String productId;
  final String productName;

  const ProductHeading({
    super.key,
    required this.productId,
    required this.productName,
  });

  @override
  State<ProductHeading> createState() => _ProductHeadingState();
}

class _ProductHeadingState extends State<ProductHeading> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.productName,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        // TODO: Implement the favorite product functionality
        // IconButton(
        //   onPressed: () => setState(() => _isFavorite = !_isFavorite),
        //   icon: Icon(
        //     _isFavorite
        //         ? Icons.favorite_rounded
        //         : Icons.favorite_outline_rounded,
        //     color: _isFavorite ? Colors.redAccent : Colors.black87,
        //     size: 28,
        //   ),
        // ),
      ],
    );
  }
}
