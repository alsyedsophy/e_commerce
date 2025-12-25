import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/products/domain/entities/cateroty.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failures, List<Product>>> getAllProducts({
    int limit = 10,
    String? lastDocumentId,
  });
  Future<Either<Failures, Product>> getProductById(String id);

  Future<Either<Failures, List<Product>>> getFeaturedProduct({int limit = 10});
  Future<Either<Failures, List<Product>>> getProductsByCategory(
    String categoryId, {
    int limit = 10,
  });
  Future<Either<Failures, List<Product>>> searchProucts(String query);
  Future<Either<Failures, List<Product>>> getNewProducts({int limit = 10});

  Future<Either<Failures, List<Category>>> getCategories({int limit = 10});
}
