import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final String actionRoute;

  const CategoryItem({
    super.key,
    required this.label,
    required this.icon,
    required this.actionRoute,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => context.go(actionRoute),
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
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
