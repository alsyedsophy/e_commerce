import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';

class ClearCartUseCase extends UseCase<void, NoParams> {
  final CartRepo cartRepo;

  ClearCartUseCase({required this.cartRepo});
  @override
  Future<Either<Failures, void>> call(NoParams params) {
    return cartRepo.clearCart();
  }
}
