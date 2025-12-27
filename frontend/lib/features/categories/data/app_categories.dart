import 'package:flutter/material.dart';
import 'package:frontend/features/categories/model/app_category_model.dart';

List<AppCategoryModel> appCategories = [
  AppCategoryModel(id: 'clothing', label: 'Clothing', icon: Icons.shopping_bag),
  AppCategoryModel(id: 'makeup', label: 'Makeup', icon: Icons.brush),
  AppCategoryModel(id: 'skincare', label: 'Skincare', icon: Icons.spa),
  AppCategoryModel(
    id: 'haircare',
    label: 'Hair Care',
    icon: Icons.face_retouching_natural,
  ),
  AppCategoryModel(id: 'accessories', label: 'Accessories', icon: Icons.watch),
  AppCategoryModel(
    id: 'footwear',
    label: 'Footwear',
    icon: Icons.directions_walk,
  ),
  AppCategoryModel(id: 'jewelry', label: 'Jewelry', icon: Icons.diamond),
  AppCategoryModel(
    id: 'fragrance',
    label: 'Fragrance',
    icon: Icons.local_florist,
  ),
];
