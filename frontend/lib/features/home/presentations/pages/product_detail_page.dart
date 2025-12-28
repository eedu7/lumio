import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentations/widgets/product_description.dart';
import 'package:frontend/features/home/presentations/widgets/product_heading.dart';
import 'package:frontend/features/home/presentations/widgets/product_price_bar.dart';
import 'package:frontend/features/home/presentations/widgets/product_review.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: context.canPop()
            ? IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back),
              )
            : null,
        title: Text('Product Details: ${widget.productId}'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 4.0,
                  children: [
                    // Product Image
                    Container(
                      color: Colors.grey.shade200,
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.network(
                          'https://i.pinimg.com/736x/7b/9c/8b/7b9c8bcde77b9491f618532d996c1b0a.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // Body
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 4.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Name
                          ProductHeading(),

                          // Product Reviews
                          ProductReview(),

                          // Divider
                          Divider(),

                          // Description
                          ProductDescription(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ProductPriceBar(),
          ],
        ),
      ),
    );
  }
}
