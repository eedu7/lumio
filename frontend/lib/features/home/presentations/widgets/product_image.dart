import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String src;

  const ProductImage({super.key, required this.src});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Image.network(src, fit: BoxFit.contain),
      ),
    );
  }
}
