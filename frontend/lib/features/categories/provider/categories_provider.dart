import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:frontend/features/categories/model/app_category_model.dart';
import 'package:frontend/features/categories/services/category_service.dart';

final categoriesProvider = FutureProvider<List<AppCategoryModel>>((ref) async {
  return CategoryService.getCategories();
});

final selectedCategoryProvider = StateProvider<String>((ref) {
  return 'all';
});
