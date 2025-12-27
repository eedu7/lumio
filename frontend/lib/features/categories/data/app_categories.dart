import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_routes.dart';
import 'package:frontend/features/categories/model/app_category_model.dart';

const List<AppCategoryModel> appCategories = [
  AppCategoryModel(
    id: 'clothing',
    label: 'Clothing',
    icon: Icons.shopping_bag,
    route: AppRoutes.profile,
  ),
  AppCategoryModel(
    id: 'makeup',
    label: 'Makeup',
    icon: Icons.brush,
    route: AppRoutes.notifications,
  ),
  AppCategoryModel(
    id: 'skincare',
    label: 'Skincare',
    icon: Icons.spa,
    route: AppRoutes.cart,
  ),
  AppCategoryModel(
    id: 'haircare',
    label: 'Hair Care',
    icon: Icons.face_retouching_natural,
    route: AppRoutes.cart,
  ),
  AppCategoryModel(
    id: 'accessories',
    label: 'Accessories',
    icon: Icons.watch,
    route: AppRoutes.cart,
  ),
  AppCategoryModel(
    id: 'footwear',
    label: 'Footwear',
    icon: Icons.directions_walk,
    route: AppRoutes.cart,
  ),
  AppCategoryModel(
    id: 'jewelry',
    label: 'Jewelry',
    icon: Icons.diamond,
    route: AppRoutes.cart,
  ),
  AppCategoryModel(
    id: 'fragrance',
    label: 'Fragrance',
    icon: Icons.local_florist,
    route: AppRoutes.cart,
  ),
];
