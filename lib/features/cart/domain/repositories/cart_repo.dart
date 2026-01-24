import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';

abstract class CartRepo {
  Future<Either<Failures, List<CartItem>>> getAllCartItems();
  Future<Either<Failures, void>> addCartItem(CartItem cartItem);
  Future<Either<Failures, void>> updateCartItem(
    CartItem cartItem, {
    int? quantity,
  });
  Future<Either<Failures, void>> removeCartItem(CartItem cartItem);
  Future<Either<Failures, void>> clearCart();
  Future<Either<Failures, double>> getTotalPrice();
  Future<Either<Failures, int>> getCartItemsCount();
}
