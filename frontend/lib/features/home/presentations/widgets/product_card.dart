import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_assets.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {},
      child: Card.filled(
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 4.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name 01',
                      style: textTheme.labelSmall,
                      maxLines: 1,
                    ),
                    Row(
                      spacing: 4.0,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star_half, color: Colors.amber, size: 16),
                        Text("4.4(N)", style: textTheme.labelSmall),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          padding: const EdgeInsets.all(4.0),
                          child: Text('Discount', style: textTheme.labelSmall),
                        ),
                      ],
                    ),
                    Text(
                      '\$ 700',
                      style: textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
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
