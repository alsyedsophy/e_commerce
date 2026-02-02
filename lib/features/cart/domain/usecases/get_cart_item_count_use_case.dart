import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';

class GetCartItemCountUseCase extends CartUseCase<int, NoParams> {
  final CartRepo cartRepo;

  GetCartItemCountUseCase({required this.cartRepo});

  @override
  Future<Either<CartFailure, int>> call(NoParams params) {
    return cartRepo.getCartItemsCount();
  }
}
