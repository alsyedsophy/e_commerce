import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_total.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';

class CalculateTotalCartParm {
  final List<CartItem> items;

  CalculateTotalCartParm({required this.items});
}

class CalculateTotalCartUseCasee
    extends CartUseCase<CartTotal, CalculateTotalCartParm> {
  final CartRepo cartRepo;

  CalculateTotalCartUseCasee({required this.cartRepo});

  @override
  Future<Either<CartFailure, CartTotal>> call(
    CalculateTotalCartParm params,
  ) async {
    double subtotal = 0;
    int totalItems = 0;
    bool allInStock = true;

    for (final item in params.items) {
      subtotal += item.totalPrice;
      totalItems += item.quantity;
      if (!item.inStock) {
        allInStock = false;
      }
    }

    final total = CartTotal(
      subtotal: subtotal,
      shipping: _calculateShipping(params.items),
      discount: 0,
      totalItems: totalItems,
      allInStock: allInStock,
    );

    return Right(total);
  }

  double _calculateShipping(List<CartItem> items) {
    if (items.isEmpty) return 0;

    final suptotal = items.fold(0.0, (sum, item) => sum + item.totalPrice);
    if (suptotal >= 150) {
      return 0.0;
    }
    return 10.0;
  }
}
