import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';

class UpdateCartItemParams {
  final CartItem cartItem;
  final int? quantity;

  UpdateCartItemParams({required this.cartItem, this.quantity});
}

class UpdateCartItemUseCase extends UseCase<void, UpdateCartItemParams> {
  final CartRepo cartRepo;

  UpdateCartItemUseCase({required this.cartRepo});

  @override
  Future<Either<Failures, void>> call(UpdateCartItemParams params) async {
    return await cartRepo.updateCartItem(
      params.cartItem,
      quantity: params.quantity,
    );
  }
}
