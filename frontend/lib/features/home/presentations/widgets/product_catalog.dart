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
        childAspectRatio: 0.65,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        crossAxisCount: 2,
        children: List.generate(12, (index) => ProductCard()),
      ),
    );
  }
}
