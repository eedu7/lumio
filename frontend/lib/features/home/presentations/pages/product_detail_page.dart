import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentations/widgets/product_color_selector.dart';
import 'package:frontend/features/home/presentations/widgets/product_description.dart';
import 'package:frontend/features/home/presentations/widgets/product_heading.dart';
import 'package:frontend/features/home/presentations/widgets/product_image.dart';
import 'package:frontend/features/home/presentations/widgets/product_price_bar.dart';
import 'package:frontend/features/home/presentations/widgets/product_quantity_selector.dart';
import 'package:frontend/features/home/presentations/widgets/product_review.dart';
import 'package:frontend/features/home/presentations/widgets/product_size_selector.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String _selectedSize = 'M';
  Color _selectedColor = Colors.black;
  int _selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withValues(alpha: 0.9),
            child: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white.withValues(alpha: 0.9),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  size: 20,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image Section
                  ProductImage(
                    src:
                        'https://i.pinimg.com/736x/7b/9c/8b/7b9c8bcde77b9491f618532d996c1b0a.jpg',
                  ),

                  // Detail Content
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 24.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProductHeading(),
                        const SizedBox(height: 12),
                        const ProductReview(),

                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Divider(
                            thickness: 1,
                            color: Color(0xFFEEEEEE),
                          ),
                        ),

                        const ProductDescription(),
                        const SizedBox(height: 24),

                        // Size Selection
                        Text(
                          "Size",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ProductSizeSelector(
                          sizes: const ['XS', 'S', 'M', 'L', 'XL'],
                          selectedSize: _selectedSize,
                          onSelected: (size) =>
                              setState(() => _selectedSize = size),
                        ),
                        const SizedBox(height: 24),

                        // Color Selection
                        Text(
                          "Color",
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ProductColorSelector(
                          colors: [
                            Colors.black87,
                            Colors.red.shade500,
                            Colors.blue.shade500,
                            Colors.green.shade500,
                          ],
                          selectedColor: _selectedColor,
                          onSelected: (color) =>
                              setState(() => _selectedColor = color),
                        ),
                        const SizedBox(height: 24),

                        // Quantity Section
                        Row(
                          children: [
                            Text(
                              "Quantity",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 20),
                            ProductQuantitySelector(
                              quantity: _selectedQuantity,
                              onChanged: (int value) =>
                                  setState(() => _selectedQuantity = value),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Sticky Bottom Bar
          ProductPriceBar(),
        ],
      ),
    );
  }
}
