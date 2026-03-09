import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/AddProduct/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/core/repositories/image/image_repository.dart';
import 'package:fruits_hub_dashboard/core/repositories/product/product_repository.dart';
import 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final ImageRepository imageRepository;
  final ProductRepository productRepository;

  AddProductCubit(this.imageRepository, this.productRepository)
      : super(AddProductInitial());

  Future<void> addProduct(ProductEntity product, File image) async {
    emit(AddProductLoading());

    final imageResult = await imageRepository.uploadImage(image);

    imageResult.fold(
      (failure) => emit(AddProductFailure(failure.errMessage)),
      (imageUrl) async {
        final productWithImage = ProductEntity(
          name: product.name,
          price: product.price,
          code: product.code,
          description: product.description,
          isFeatured: product.isFeatured,
          imageUrl: imageUrl,
           reviews: product.reviews,
            expirationsMonths: product.expirationsMonths,
             numberOfCalories: product.numberOfCalories,
              unitAmount: product.unitAmount,
              isOrganic: product.isOrganic,
        );

        final productResult = await productRepository.addProduct(productWithImage);

        productResult.fold(
         (failure) async {

    await imageRepository.deleteImage(imageUrl);

    emit(AddProductFailure(failure.errMessage));
  },
          (unit) => emit(AddProductSuccess()),
        );
      },
    );
  }
}
