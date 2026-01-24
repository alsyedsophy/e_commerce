import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';

class AddCartItemParams {
  final CartItem cartItem;

  AddCartItemParams({required this.cartItem});
}

class AddCartItemUseCase extends UseCase<void, AddCartItemParams> {
  final CartRepo cartRepo;

  AddCartItemUseCase({required this.cartRepo});

  @override
  Future<Either<Failures, void>> call(AddCartItemParams params) async {
    return cartRepo.addCartItem(params.cartItem);
  }
}
