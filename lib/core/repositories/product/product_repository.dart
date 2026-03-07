import '../../../features/dashboard/domain/entities/product_entity.dart';

abstract class ProductRepository {
 Future<Either<Failure, void>> addProduct(ProductEntity product);
  Future<Either<Failure, void>> updateProduct(ProductEntity product);
  Future<Either<Failure, void>> deleteProduct(String productId);
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
