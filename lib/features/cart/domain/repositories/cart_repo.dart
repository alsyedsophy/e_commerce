import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';

abstract class CartRepo {
  //? Local Operations
  Future<Either<CartFailure, List<CartItem>>> getCartItems();
  Future<Either<CartFailure, void>> addToCart(CartItem cartItem);
  Future<Either<CartFailure, void>> updateCartItem(
    CartItem cartItem, {
    int? quantity,
  });
  Future<Either<CartFailure, void>> removeFromCart(CartItem cartItem);
  Future<Either<CartFailure, void>> clearCart();
  Future<Either<CartFailure, double>>
  getTotalPrice(); // تتحذف احنا اصلا هنحسبها داخل ال Entity
  Future<Either<CartFailure, int>> getCartItemsCount();
  Future<Either<CartFailure, bool>> isInCart(CartItem cartItem);

  //? Remote Operations
  Future<Either<CartFailure, List<CartItem>>> getServerCart();
  Future<Either<CartFailure, void>> syncCartWithServerCart(
    List<CartItem> items,
  );
  Future<Either<CartFailure, void>> mergeLocalAndServerCart();
}
