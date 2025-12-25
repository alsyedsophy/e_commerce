import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/products/data/data%20sourse/product_remote_data_source.dart';
import 'package:e_commerce/features/products/domain/entities/cateroty.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:e_commerce/features/products/domain/repository/product_repository.dart';

class ProductRepoImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepoImpl({required this.remoteDataSource});

  // جلب جميع المنتجات
  @override
  Future<Either<Failures, List<Product>>> getAllProducts({
    int limit = 10,
    String? lastDocumentId,
  }) async {
    try {
      final products = await remoteDataSource.getAllProducts(
        limit: limit,
        lastDocumentId: lastDocumentId,
      );
      return Right(products);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  @override
  Future<Either<Failures, List<Product>>> getFeaturedProduct({
    int limit = 10,
  }) async {
    try {
      final products = await remoteDataSource.getFeaturedProducts(limit: limit);
      return Right(products);
    } catch (e) {
      log(e.toString());
      return Left(_handleError(e));
    }
  }

  @override
  Future<Either<Failures, List<Product>>> getNewProducts({
    int limit = 10,
  }) async {
    try {
      final products = await remoteDataSource.getNewProducts(limit: limit);
      return Right(products);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  @override
  Future<Either<Failures, Product>> getProductById(String id) async {
    try {
      final product = await remoteDataSource.productDetails(id);
      return Right(product);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  @override
  Future<Either<Failures, List<Product>>> getProductsByCategory(
    String categoryId, {
    int limit = 10,
  }) async {
    try {
      final products = await remoteDataSource.getProductsByCategoryId(
        categoryId,
        limit: limit,
      );
      return Right(products);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  @override
  Future<Either<Failures, List<Product>>> searchProucts(String query) async {
    try {
      final products = await remoteDataSource.searchProducts(query);
      return Right(products);
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  Failures _handleError(dynamic error) {
    final errorString = error.toString().toLowerCase();
    if (errorString == 'network' ||
        errorString == 'socket' ||
        errorString == 'connection') {
      return NetworkFailure("Check Internet Connection");
    }
    if (errorString == 'firestore' || errorString == 'permission') {
      return FirestoreFailure("Faild To connect by database");
    }
    if (errorString == 'not found') {
      return OutOfStockFailure();
    }
    return ServerFailure(error.toString());
  }

  @override
  Future<Either<Failures, List<Category>>> getCategories({
    int limit = 10,
  }) async {
    try {
      final category = await remoteDataSource.getCategoris(limit: limit);
      return Right(category);
    } catch (e) {
      return Left(_handleError(e));
    }
  }
}
