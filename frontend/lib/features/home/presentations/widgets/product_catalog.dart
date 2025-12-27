import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentations/widgets/product_card.dart';

class ProductCatalog extends StatefulWidget {
  const ProductCatalog({super.key});

  @override
  State<ProductCatalog> createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.count(
        clipBehavior: Clip.antiAlias,
        childAspectRatio: 0.6,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
        crossAxisCount: 2,
        children: List.generate(3, (index) => ProductCard()),
      ),
    );
  }
}
