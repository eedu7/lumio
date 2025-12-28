import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentations/widgets/label.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.0,
      children: [
        Label(text: 'Description'),
        Text(
          'Stay effortlessly stylish with this Short Cape Jacket, designed to elevate your everyday and formal looks. Crafted from premium-quality fabric, it features a modern cropped silhouette with a relaxed drape that offers both comfort and sophistication. The structured shoulders and clean lines make it perfect for layering over dresses, tops, or knitwear.'
          'Ideal for transitional weather, this jacket provides warmth without feeling bulky. Whether you’re heading to work, a casual outing, or an evening event, it adds a refined touch to any outfit.',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
