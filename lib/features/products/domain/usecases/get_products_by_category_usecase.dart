import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:e_commerce/features/products/domain/repository/product_repository.dart';

class GetProductsByCategoryParams {
  final String categoryId;
  final int limit;

  GetProductsByCategoryParams(this.categoryId, this.limit);
}

class GetProductsByCategoryUsecase
    extends UseCase<List<Product>, GetProductsByCategoryParams> {
  final ProductRepository repository;

  GetProductsByCategoryUsecase({required this.repository});

  @override
  Future<Either<Failures, List<Product>>> call(
    GetProductsByCategoryParams params,
  ) async {
    return await repository.getProductsByCategory(
      params.categoryId,
      limit: params.limit,
    );
  }
}
