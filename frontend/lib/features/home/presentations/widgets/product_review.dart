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
      children: [
        const InfoBox(label: '62 sold'),
        const SizedBox(width: 12),
        const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
        const SizedBox(width: 4),
        InkWell(
          onTap: () =>
              context.push(AppRoutes.reviewProduct(productId: '00-00-000-00')),
          child: Text(
            '4.4 (42 Reviews)',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
