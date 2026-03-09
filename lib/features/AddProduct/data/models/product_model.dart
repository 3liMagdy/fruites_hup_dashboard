import 'package:fruits_hub_dashboard/core/functions/getAvgRating.dart';
import 'package:fruits_hub_dashboard/core/models/review_model.dart';
import 'package:fruits_hub_dashboard/features/AddProduct/domain/entities/product_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;

  final bool isFeatured;
  final num sellingCount;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final List<ReviewModel> reviews;
  ProductModel(
      {required this.name,
      required this.code,
      required this.description,
      required this.expirationsMonths,
      required this.numberOfCalories,
      required this.avgRating,
      required this.unitAmount,
      required this.sellingCount,
      required this.reviews,
      required this.price,
      required this.isOrganic,
      required this.isFeatured,
      this.imageUrl, required this.ratingCount});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      avgRating: getAvgRating(json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : []),
      name: json['name'],
      code: json['code'],
      description: json['description'],
      expirationsMonths: json['expirationsMonths'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      sellingCount: json['sellingCount'] ?? 0,
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : [],
      price: json['price'],
      isOrganic: json['isOrganic'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'], 
      ratingCount: json['ratingCount'] ?? 0,
    );
  }


factory ProductModel.fromEntity(ProductEntity entity) {
  return ProductModel(
    name: entity.name,
    code: entity.code,
    description: entity.description,
    price: entity.price,
    isFeatured: entity.isFeatured,
    imageUrl: entity.imageUrl,
    expirationsMonths: entity.expirationsMonths,
    numberOfCalories: entity.numberOfCalories,
    unitAmount: entity.unitAmount,
    isOrganic: entity.isOrganic,
    reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
    avgRating: 0,
    ratingCount: 0,
    sellingCount: 0,
  );
}


  ProductEntity toEntity() {
    return ProductEntity(
        name: name,
        code: code,
        description: description,
        price: price,
        reviews: reviews.map((e) => e.toEntity()).toList(),
        expirationsMonths: expirationsMonths,
        numberOfCalories: numberOfCalories,
        unitAmount: unitAmount,
        isOrganic: isOrganic,
        isFeatured: isFeatured,
        imageUrl: imageUrl);
  }

  toJson() {
    return {
'name': name,
'code': code,
'description': description,
'price': price,
'isFeatured': isFeatured,
'imageUrl': imageUrl,
'expirationsMonths': expirationsMonths,
'numberOfCalories': numberOfCalories,
'unitAmount': unitAmount,
'isOrganic': isOrganic,
'sellingCount': sellingCount,
'avgRating': avgRating,
'ratingCount': ratingCount,
'reviews': reviews.map((e) => e.toJson()).toList()
};
  }
}
