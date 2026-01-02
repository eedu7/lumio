class ProductImageModel {
  final String imageUrl;

  ProductImageModel({required this.imageUrl});

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    return ProductImageModel(imageUrl: json['image_url']);
  }
}
