import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_assets.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/home/presentations/widgets/info_box.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      onTap: () =>
          context.push(AppRoutes.productsDetail(productId: 'product-id')),
      child: Card.filled(
        elevation: 0.5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 4.0,
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  AppAssets.socialLoginEnterAssetImage,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  spacing: 4.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name 01',
                      style: textTheme.bodyMedium,
                      maxLines: 1,
                    ),
                    Row(
                      spacing: 8.0,
                      children: [
                        Text(
                          '\$700',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InfoBox(label: 'Discount'),
                      ],
                    ),
                    Row(
                      spacing: 4.0,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Text('4.4(N)', style: textTheme.bodySmall),
                        Text('(N) Reviews', style: textTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
