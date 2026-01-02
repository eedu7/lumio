import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/categories/model/app_category_model.dart';
import 'package:frontend/features/categories/provider/categories_provider.dart';

class ProductCategoriesSmall extends ConsumerWidget {
  const ProductCategoriesSmall({super.key});

  static const String allCategoryId = 'all';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryId = ref.watch(selectedCategoryProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

    return categoriesAsync.when(
      loading: () => const SizedBox(
        height: 42,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SizedBox(
        height: 42,
        child: Center(child: Text('Failed to load categories')),
      ),
      data: (categories) {
        final categoriesWithAll = [
          const AppCategoryModel(
            id: allCategoryId,
            label: 'All',
            icon: Icons.apps,
          ),
          ...categories,
        ];

        return SizedBox(
          height: 42,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesWithAll.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final category = categoriesWithAll[index];
              final isSelected = selectedCategoryId == category.id;

              return GestureDetector(
                onTap: () {
                  ref.read(selectedCategoryProvider.notifier).state =
                      category.id;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      category.label,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: isSelected ? Colors.white : Colors.grey[700],
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
