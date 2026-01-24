import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';

class GetAllCartItemsUseCase extends UseCase<List<CartItem>, NoParams> {
  final CartRepo cartRepo;

  GetAllCartItemsUseCase({required this.cartRepo});
  @override
  Future<Either<Failures, List<CartItem>>> call(NoParams params) {
    return cartRepo.getAllCartItems();
  }
}
