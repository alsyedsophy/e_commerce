import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:e_commerce/features/products/domain/repository/product_repository.dart';

class GetProductByIdParams {
  final String productId;

  GetProductByIdParams(this.productId);
}

class GetProductByIdUsecase extends UseCase<Product, GetProductByIdParams> {
  final ProductRepository repository;

  GetProductByIdUsecase({required this.repository});

  @override
  Future<Either<Failures, Product>> call(GetProductByIdParams params) async {
    return await repository.getProductById(params.productId);
  }
}
