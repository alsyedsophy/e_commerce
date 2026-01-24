import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/cart/data/data%20source/cart_local_data_source.dart';
import 'package:e_commerce/features/cart/data/model/cart_item_model.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartLocalDataSource cartLocalDataSource;

  CartRepoImpl({required this.cartLocalDataSource});

  @override
  Future<Either<Failures, void>> addCartItem(CartItem cartItem) async {
    try {
      await cartLocalDataSource.addCartItem(cartItem.toModel());
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> clearCart() async {
    try {
      await cartLocalDataSource.cleareCart();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<CartItem>>> getAllCartItems() async {
    try {
      final items = await cartLocalDataSource.getAllCartItems();
      final entities = items.map((e) => e.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, int>> getCartItemsCount() async {
    try {
      final items = await cartLocalDataSource.getAllCartItems();
      final count = items.length;
      return Right(count);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, double>> getTotalPrice() async {
    try {
      final items = await cartLocalDataSource.getAllCartItems();
      final price = items.fold<double>(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );
      return Right(price);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> removeCartItem(CartItem cartItem) async {
    try {
      await cartLocalDataSource.removeCartItem(cartItem.toModel());
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> updateCartItem(
    CartItem cartItem, {
    int? quantity,
  }) async {
    try {
      await cartLocalDataSource.updateCartItem(
        cartItem.toModel(),
        quantity: quantity,
      );
      return const Right(null);
    } catch (e) {
      // log(e.toString());
      return Left(CacheFailure(e.toString()));
    }
  }
}

extension CartItemMapper on CartItem {
  CartItemModel toModel() {
    return CartItemModel(
      id: this.id, // علشان فى داله اسمها id داخل ال dartz يتعارض معها
      name: name,
      image: image,
      price: price,
      quantity: quantity,
      size: size,
      color: color,
      stock: stock,
    );
  }
}

extension CartImtemModelMapper on CartItemModel {
  CartItem toEntity() {
    return CartItem(
      id: this.id,
      name: name,
      image: image,
      price: price,
      quantity: quantity,
      size: size,
      color: color,
      stock: stock,
    );
  }
}
