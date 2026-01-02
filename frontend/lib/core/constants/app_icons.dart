import 'package:flutter/material.dart';

class AppIcons {
  static const Map<String, IconData> material = {
    'spa': Icons.spa,
    'brush': Icons.brush,
    'shopping_bag': Icons.shopping_bag,
    'local_florist': Icons.local_florist,
    'diamond': Icons.diamond,
    'directions_walk': Icons.directions_walk,
    'face_retouching_natural': Icons.face_retouching_natural,
    'watch': Icons.watch,
  };

  static IconData get(String name) {
    return material[name] ?? Icons.category;
  }
}
