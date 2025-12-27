import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/home/presentations/widgets/category_item.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        padding: const EdgeInsets.all(8.0),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        crossAxisCount: 4,
        children: const <Widget>[
          CategoryItem(
            label: 'Clothing',
            icon: Icons.shopping_bag,
            actionRoute: AppRoutes.profile,
          ),
          CategoryItem(
            label: 'Makeup',
            icon: Icons.brush,
            actionRoute: AppRoutes.notifications,
          ),
          CategoryItem(
            label: 'Skincare',
            icon: Icons.spa,
            actionRoute: AppRoutes.cart,
          ),
          CategoryItem(
            label: 'Hair Care',
            icon: Icons.face_retouching_natural,
            actionRoute: AppRoutes.cart,
          ),
          CategoryItem(
            label: 'Accessories',
            icon: Icons.watch,
            actionRoute: AppRoutes.cart,
          ),
          CategoryItem(
            label: 'Footwear',
            icon: Icons.directions_walk,
            actionRoute: AppRoutes.cart,
          ),
          CategoryItem(
            label: 'Jewelry',
            icon: Icons.diamond,
            actionRoute: AppRoutes.cart,
          ),
          CategoryItem(
            label: 'Fragrance',
            icon: Icons.local_florist,
            actionRoute: AppRoutes.cart,
          ),
        ],
      ),
    );
  }
}
