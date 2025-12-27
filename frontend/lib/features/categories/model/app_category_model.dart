import 'package:flutter/material.dart';

class AppCategoryModel {
  final String id;
  final String label;
  final IconData icon;
  final String route;

  const AppCategoryModel({
    required this.id,
    required this.label,
    required this.icon,
    required this.route,
  });
}
