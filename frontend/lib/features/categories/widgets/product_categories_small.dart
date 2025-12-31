import 'package:flutter/material.dart';
import 'package:frontend/features/categories/data/app_categories.dart';
import 'package:frontend/features/categories/model/app_category_model.dart';

class ProductCategoriesSmall extends StatefulWidget {
  const ProductCategoriesSmall({super.key});

  @override
  State<ProductCategoriesSmall> createState() => _ProductCategoriesSmallState();
}

class _ProductCategoriesSmallState extends State<ProductCategoriesSmall> {
  static const String allCategoryId = 'all';
  String _selectedCategoryId = allCategoryId;
  late final List<AppCategoryModel> _categoriesWithAll;

  @override
  void initState() {
    super.initState();
    _categoriesWithAll = [
      const AppCategoryModel(id: allCategoryId, label: 'All', icon: Icons.apps),
      ...appCategories,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _categoriesWithAll.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = _categoriesWithAll[index];
          final isSelected = _selectedCategoryId == category.id;

          return GestureDetector(
            onTap: () => setState(() => _selectedCategoryId = category.id),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? theme.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: isSelected ? theme.primaryColor : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Text(
                  category.label,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: isSelected ? Colors.white : Colors.grey[700],
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
