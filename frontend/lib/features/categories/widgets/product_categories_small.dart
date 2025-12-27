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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _categoriesWithAll.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = _categoriesWithAll[index];
          final isSelected = _selectedCategoryId == category.id;

          return ChoiceChip(
            showCheckmark: false,
            label: Text(
              category.label,
              style: textTheme.labelMedium?.copyWith(
                color: isSelected ? colorScheme.onPrimary : null,
              ),
            ),
            selected: isSelected,
            onSelected: (_) {
              setState(() {
                _selectedCategoryId = category.id;
              });
            },
            selectedColor: colorScheme.primary,
            backgroundColor: colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          );
        },
      ),
    );
  }
}
