import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';

class RemoveCartItemParams {
  final CartItem cartItem;

  RemoveCartItemParams({required this.cartItem});
}

class RemoveCartItemUseCase extends UseCase<void, RemoveCartItemParams> {
  final CartRepo cartRepo;

  RemoveCartItemUseCase({required this.cartRepo});
  @override
  Future<Either<Failures, void>> call(RemoveCartItemParams params) async {
    return await cartRepo.removeCartItem(params.cartItem);
  }
}
