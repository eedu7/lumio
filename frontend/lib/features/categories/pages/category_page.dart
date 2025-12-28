import 'package:flutter/material.dart';
import 'package:frontend/features/categories/widgets/product_categories_small.dart';
import 'package:frontend/features/home/presentations/widgets/product_catalog.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends StatefulWidget {
  final String qKey;
  final String qValue;
  final String discount;
  final bool showCategoryButton;

  const CategoryPage({
    super.key,
    required this.qKey,
    required this.qValue,
    required this.discount,
    required this.showCategoryButton,
  });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              leading: context.canPop()
                  ? IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back),
                    )
                  : null,
              title: Text(widget.qValue, style: textTheme.titleLarge),
            ),

            SliverToBoxAdapter(
              child: Column(
                spacing: 8.0,
                children: [
                  if (widget.showCategoryButton) const ProductCategoriesSmall(),
                  const ProductCatalog(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
