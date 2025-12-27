import 'package:flutter/material.dart';
import 'package:frontend/features/categories/data/app_categories.dart';
import 'package:frontend/features/categories/widgets/category_item.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        crossAxisCount: 4,
        children: appCategories
            .map(
              (category) =>
                  CategoryItem(label: category.label, icon: category.icon),
            )
            .toList(),
      ),
    );
  }
}
