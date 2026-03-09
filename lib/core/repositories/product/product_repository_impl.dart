import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/exceptions.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repositories/product/product_repository.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service_Products.dart';
import 'package:fruits_hub_dashboard/core/utils/app_constant.dart';
import 'package:fruits_hub_dashboard/features/AddProduct/data/models/product_model.dart';
import 'package:fruits_hub_dashboard/features/AddProduct/domain/entities/product_entity.dart';

class ProductRepositoryImpl implements ProductRepository {
  final StorageServiceProducts firestoreService;

  ProductRepositoryImpl(this.firestoreService);

  @override
  Future<Either<Failure, Unit>> addProduct(ProductEntity product) async {
    try {
      await firestoreService.addData(
        EndPoients.productsTable,
        ProductModel.fromEntity(product).toJson(),
      );
      return const Right(unit);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateProduct(ProductEntity product) async {
    try {
      await firestoreService.updateData(
        '${EndPoients.productsTable}/${product.code}',
        ProductModel.fromEntity(product).toJson(),
      );
      return const Right(unit);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(String productId) async {
    try {
      await firestoreService.deleteData('${EndPoients.productsTable}/$productId');
      return const Right(unit);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final data = await firestoreService.getCollection(EndPoients.productsTable,);
      final List<ProductEntity> products =
    data.map<ProductEntity>((e) => ProductModel.fromJson(e).toEntity()).toList();
      return Right(products);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
