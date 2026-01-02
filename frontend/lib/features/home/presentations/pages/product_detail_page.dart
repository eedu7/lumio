import 'package:flutter/material.dart';
import 'package:frontend/features/home/model/product_model.dart';
import 'package:frontend/features/home/presentations/widgets/product_description.dart';
import 'package:frontend/features/home/presentations/widgets/product_heading.dart';
import 'package:frontend/features/home/presentations/widgets/product_image.dart';
import 'package:frontend/features/home/presentations/widgets/product_price_bar.dart';
import 'package:frontend/features/home/presentations/widgets/product_quantity_selector.dart';
import 'package:frontend/features/home/services/product_service.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Future<ProductModel> _productFuture;

  // TODO: Product Size Selection
  // String _selectedSize = 'M';
  // TODO: Product Color Selection
  // Color _selectedColor = Colors.black;
  int _selectedQuantity = 1;

  @override
  void initState() {
    super.initState();
    _productFuture = ProductService.getProductById(id: widget.productId);
  }

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
      ),
      body: FutureBuilder(
        future: _productFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Expanded(
              child: const Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasError) {
            return Expanded(child: const Text('Failed to load product'));
          }

          final ProductModel product = snapshot.data!;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Image Section
                      ProductImage(src: product.image.imageUrl),

                      // Detail Content
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 24.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProductHeading(
                              productId: product.id,
                              productName: product.name,
                            ),

                            // TODO: Implement Product Review
                            // const SizedBox(height: 12),
                            // ProductReview(productId: product.id),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: Divider(
                                thickness: 2,
                                color: Color(0xFFEEEEEE),
                              ),
                            ),

                            ProductDescription(
                              productDescription: product.description,
                            ),
                            const SizedBox(height: 24),

                            // TODO: Implement Size selection
                            // // Size Selection
                            // Text(
                            //   "Size",
                            //   style: theme.textTheme.titleMedium?.copyWith(
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // const SizedBox(height: 12),
                            // ProductSizeSelector(
                            //   sizes: const ['XS', 'S', 'M', 'L', 'XL'],
                            //   selectedSize: _selectedSize,
                            //   onSelected: (size) =>
                            //       setState(() => _selectedSize = size),
                            // ),
                            // const SizedBox(height: 24),

                            // TODO: Implement Color Selection
                            // // Color Selection
                            // Text(
                            //   "Color",
                            //   style: theme.textTheme.titleMedium?.copyWith(
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // const SizedBox(height: 12),
                            // ProductColorSelector(
                            //   colors: [
                            //     Colors.black87,
                            //     Colors.red.shade500,
                            //     Colors.blue.shade500,
                            //     Colors.green.shade500,
                            //   ],
                            //   selectedColor: _selectedColor,
                            //   onSelected: (color) =>
                            //       setState(() => _selectedColor = color),
                            // ),
                            // const SizedBox(height: 24),

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
              ProductPriceBar(
                price: product.price * _selectedQuantity,
                buttonLabel: 'Add to Cart',
                icon: Icons.shopping_bag_outlined,
                onPressed: () {
                  // TODO: Implement the cart logic
                  // Handle adding to cart logic here
                  print("Added to cart: ${widget.productId}");
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
