import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:e_commerce/features/products/domain/repository/product_repository.dart';

class GetFeaturedProductParams {
  final int limit;

  GetFeaturedProductParams(this.limit);
}

class GetFeaturedProductUsecse
    extends UseCase<List<Product>, GetFeaturedProductParams> {
  final ProductRepository repository;

  GetFeaturedProductUsecse({required this.repository});

  @override
  Future<Either<Failures, List<Product>>> call(
    GetFeaturedProductParams params,
  ) async {
    return await repository.getFeaturedProduct(limit: params.limit);
  }
}
