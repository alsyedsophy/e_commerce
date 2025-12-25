import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:e_commerce/features/products/domain/repository/product_repository.dart';

class GetAllProductsParams {
  final int limit;
  final String? lastDocumentId;

  GetAllProductsParams(this.limit, this.lastDocumentId);
}

class GetAllProductsUsecase
    extends UseCase<List<Product>, GetAllProductsParams> {
  final ProductRepository repository;

  GetAllProductsUsecase({required this.repository});
  @override
  Future<Either<Failures, List<Product>>> call(
    GetAllProductsParams params,
  ) async {
    return await repository.getAllProducts(
      limit: params.limit,
      lastDocumentId: params.lastDocumentId,
    );
  }
}
