import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';

class GetTotalPriceUseCase extends UseCase<double, NoParams> {
  final CartRepo cartRepo;

  GetTotalPriceUseCase({required this.cartRepo});

  @override
  Future<Either<Failures, double>> call(NoParams params) {
    return cartRepo.getTotalPrice();
  }
}
