import 'package:frontend/features/home/model/product_image_model.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String categoryId;
  final ProductImageModel image;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      categoryId: json['category_id'],
      image: ProductImageModel.fromJson(json['image']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category_id': categoryId,
      'image': image.toJson(),
    };
  }
}
