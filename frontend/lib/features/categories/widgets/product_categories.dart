import 'package:flutter/material.dart';
import 'package:frontend/features/categories/data/app_categories.dart';
import 'package:frontend/features/categories/widgets/category_item.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: appCategories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 16,
        crossAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final category = appCategories[index];
        return CategoryItem(label: category.label, icon: category.icon);
      },
    );
  }
}
