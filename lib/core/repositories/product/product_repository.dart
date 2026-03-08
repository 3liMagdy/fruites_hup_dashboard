import 'package:dartz/dartz.dart';
import '../../../features/AddProduct/domain/entities/product_entity.dart';
import '../../errors/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, Unit>> addProduct(ProductEntity product);
  Future<Either<Failure, Unit>> updateProduct(ProductEntity product);
  Future<Either<Failure, Unit>> deleteProduct(String productId);
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
