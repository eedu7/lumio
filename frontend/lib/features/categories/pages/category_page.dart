import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/categories/provider/categories_provider.dart';
import 'package:frontend/features/categories/widgets/product_categories_small.dart';
import 'package:frontend/features/home/presentations/widgets/product_catalog.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends ConsumerStatefulWidget {
  final String? categoryId;
  final String qKey;
  final String qValue;
  final String discount;
  final bool showCategoryButton;

  const CategoryPage({
    super.key,
    required this.qKey,
    this.categoryId,
    required this.qValue,
    required this.discount,
    required this.showCategoryButton,
  });

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.categoryId != null && widget.categoryId!.isNotEmpty) {
        ref.read(selectedCategoryProvider.notifier).state = widget.categoryId!;
      } else if (widget.qKey == 'categoryId') {
        ref.read(selectedCategoryProvider.notifier).state = widget.qValue;
      } else {
        ref.read(selectedCategoryProvider.notifier).state =
            ProductCategoriesSmall.allCategoryId;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool shouldDisplayCategories =
        widget.categoryId == null && widget.showCategoryButton;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
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
            slivers: [
              if (shouldDisplayCategories)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: ProductCategoriesSmall(),
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              const SliverToBoxAdapter(child: ProductCatalog()),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
