import 'package:flutter/material.dart';
import 'package:frontend/core/constants/app_icons.dart';

class AppCategoryModel {
  final String id;
  final String label;
  final IconData icon;

  const AppCategoryModel({
    required this.id,
    required this.label,
    required this.icon,
  });

  factory AppCategoryModel.fromJson(Map<String, dynamic> json) {
    return AppCategoryModel(
      id: json['id'] as String,
      label: json['name'] as String,
      icon: AppIcons.fromString(json['icon'] as String),
    );
  }
}
