import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentations/widgets/info_box.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InfoBox(label: '62 sold'),
        Row(
          spacing: 4.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber, size: 18),
            Text('4.4', style: theme.textTheme.bodyMedium),
            Text('(42) Reviews', style: theme.textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}
