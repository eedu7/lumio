import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentations/widgets/info_box.dart';
import 'package:frontend/features/home/presentations/widgets/label.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 4.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Name
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Short Cape Jacket",
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.grey.shade200,
                                ),
                                onPressed: () {
                                  // TODO: Add to wishlist or favorite
                                  setState(() {
                                    _isFavorite = !_isFavorite;
                                  });
                                },
                                icon: Icon(
                                  _isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: _isFavorite ? Colors.red : null,
                                ),
                              ),
                            ],
                          ),

                          // Product Reviews
                          Row(
                            spacing: 8.0,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InfoBox(label: '62 sold'),
                              Row(
                                spacing: 4.0,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                  Text(
                                    '4.4',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                  Text(
                                    '(42) Reviews',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Divider
                          Divider(),

                          // Description
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4.0,
                            children: [
                              Label(text: 'Description'),
                              Text(
                                'Stay effortlessly stylish with this Short Cape Jacket, designed to elevate your everyday and formal looks. Crafted from premium-quality fabric, it features a modern cropped silhouette with a relaxed drape that offers both comfort and sophistication. The structured shoulders and clean lines make it perfect for layering over dresses, tops, or knitwear.'
                                'Ideal for transitional weather, this jacket provides warmth without feeling bulky. Whether you’re heading to work, a casual outing, or an evening event, it adds a refined touch to any outfit.',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price description'),
                          Text('Total Price'),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: Text('Add to cart'),
                        icon: Icon(Icons.add_shopping_cart),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
