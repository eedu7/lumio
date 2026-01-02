import 'package:flutter/material.dart';
import 'package:frontend/features/categories/model/app_category_model.dart';
import 'package:frontend/features/categories/services/category_service.dart';
import 'package:frontend/features/categories/widgets/category_item.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AppCategoryModel>>(
      future: CategoryService.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Failed to load categories: ${snapshot.error}'),
          );
        }
        final categories = snapshot.data ?? [];

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryItem(label: category.label, icon: category.icon);
          },
        );
      },
    );
  }
}

// GridView.builder(
// shrinkWrap: true,
// physics: const NeverScrollableScrollPhysics(),
// itemCount: appCategories.length,
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 4,
// mainAxisSpacing: 16,
// crossAxisSpacing: 12,
// childAspectRatio: 0.85,
// ),
// itemBuilder: (context, index) {
// final category = appCategories[index];
// return CategoryItem(label: category.label, icon: category.icon);
// },
// );
