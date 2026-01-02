import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/categories/provider/categories_provider.dart';
import 'package:frontend/features/categories/widgets/product_categories_small.dart';
import 'package:frontend/features/home/model/product_model.dart';
import 'package:frontend/features/home/presentations/widgets/product_card.dart';
import 'package:frontend/features/home/services/product_service.dart';

class ProductCatalog extends ConsumerWidget {
  const ProductCatalog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedId = ref.watch(selectedCategoryProvider);

    return FutureBuilder<List<ProductModel>>(
      key: ValueKey(selectedId),
      future: (selectedId == ProductCategoriesSmall.allCategoryId)
          ? ProductService.getProducts()
          : ProductService.getProductsByCategoryId(categoryId: selectedId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Failed to load products'));
        }

        final products = snapshot.data ?? [];

        if (products.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Text('No products found in this category'),
            ),
          );
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              id: product.id,
              name: product.name,
              price: product.price,
              imageSrc: product.image.imageUrl,
            );
          },
        );
      },
    );
  }
}
