import 'package:fruits_hub_dashboard/features/AddProduct/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.name,
    required super.price,
    required super.code,
    required super.description,
    required super.imageUrl,
    required super.isFeatured,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      code: json['code'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "price": price,
      "code": code,
      "description": description,
      "imageUrl": imageUrl,
      "isFeatured": isFeatured,
    };
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      price: entity.price,
      code: entity.code,
      description: entity.description,
      imageUrl: entity.imageUrl,
      isFeatured: entity.isFeatured,
    );
  }
}
