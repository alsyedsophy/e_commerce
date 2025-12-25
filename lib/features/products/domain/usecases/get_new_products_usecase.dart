import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:e_commerce/features/products/domain/repository/product_repository.dart';

class GetNewProductsParams {
  final int limit;

  GetNewProductsParams(this.limit);
}

class GetNewProductsUsecase
    extends UseCase<List<Product>, GetNewProductsParams> {
  final ProductRepository repository;

  GetNewProductsUsecase({required this.repository});

  @override
  Future<Either<Failures, List<Product>>> call(
    GetNewProductsParams params,
  ) async {
    return await repository.getNewProducts(limit: params.limit);
  }
}
