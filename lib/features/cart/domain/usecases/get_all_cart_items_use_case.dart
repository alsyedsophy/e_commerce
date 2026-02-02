import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';

class GetCartItemsUseCase extends CartUseCase<List<CartItem>, NoParams> {
  final CartRepo cartRepo;

  GetCartItemsUseCase({required this.cartRepo});
  @override
  Future<Either<CartFailure, List<CartItem>>> call(NoParams params) {
    return cartRepo.getCartItems();
  }
}
