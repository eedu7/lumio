import 'package:flutter/material.dart';

class ProductSearchBar extends StatefulWidget {
  const ProductSearchBar({super.key});

  @override
  State<ProductSearchBar> createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      elevation: const WidgetStatePropertyAll(2),
      leading: Icon(Icons.search),
      trailing: [IconButton(onPressed: () {}, icon: const Icon(Icons.tune))],
      hintText: 'Search here...',
      shape: WidgetStateProperty.all(
        RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
