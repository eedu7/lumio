import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:go_router/go_router.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  final IconData icon;

  const CategoryItem({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => context.push(
        AppRoutes.categoryProducts(key: AppRoutes.categoryName, value: label),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          spacing: 8.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: theme.colorScheme.surfaceContainerHighest,
              shape: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(icon, size: 20, color: theme.colorScheme.primary),
              ),
            ),
            Text(
              label,
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
