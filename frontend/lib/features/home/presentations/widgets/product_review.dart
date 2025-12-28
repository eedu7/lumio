import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/home/presentations/widgets/info_box.dart';
import 'package:go_router/go_router.dart';

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
        InkWell(
          onTap: () =>
              context.push(AppRoutes.reviewProduct(productId: '00-00-000-00')),
          child: Row(
            spacing: 4.0,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 18),
              Text('4.4', style: theme.textTheme.bodyMedium),
              Text('(42) Reviews', style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}
