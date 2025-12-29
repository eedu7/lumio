import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String src;

  const ProductImage({super.key, required this.src});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Hero(
          tag: src,
          child: Image.network(
            src,
            fit: BoxFit.contain,
            // Adding a placeholder for better UX
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator(strokeWidth: 2));
            },
          ),
        ),
      ),
    );
  }
}
