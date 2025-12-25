import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/products/domain/entities/cateroty.dart';
import 'package:e_commerce/features/products/domain/repository/product_repository.dart';

class GetCategoryParams {
  final int limit;

  GetCategoryParams(this.limit);
}

class GetCategoryUsecase extends UseCase<List<Category>, GetCategoryParams> {
  final ProductRepository repository;

  GetCategoryUsecase({required this.repository});

  @override
  Future<Either<Failures, List<Category>>> call(
    GetCategoryParams params,
  ) async {
    return await repository.getCategories(limit: params.limit);
  }
}
