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
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        // Prevents color change on scroll
        elevation: 0,
        centerTitle: true,
        leading: context.canPop()
            ? IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: Colors.black87,
                ),
              )
            : null,
        title: Text(
          widget.qValue,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            // Using CustomScrollView is better for performance when
            // dealing with long lists of products.
            slivers: [
              if (widget.showCategoryButton)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ProductCategoriesSmall(),
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              // We convert ProductCatalog to a sliver or wrap it
              const SliverToBoxAdapter(child: ProductCatalog()),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
