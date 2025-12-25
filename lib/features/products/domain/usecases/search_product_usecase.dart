import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:e_commerce/features/products/domain/repository/product_repository.dart';

class SearchProductParams {
  final String query;

  SearchProductParams(this.query);
}

class SearchProductUsecase extends UseCase<List<Product>, SearchProductParams> {
  final ProductRepository repository;

  SearchProductUsecase({required this.repository});

  @override
  Future<Either<Failures, List<Product>>> call(
    SearchProductParams params,
  ) async {
    return await repository.searchProucts(params.query);
  }
}
