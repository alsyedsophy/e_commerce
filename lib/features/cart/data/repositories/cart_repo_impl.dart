import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/network/network_info.dart';
import 'package:e_commerce/features/cart/data/data%20source/cart_local_data_source.dart';
import 'package:e_commerce/features/cart/data/data%20source/cart_remote_datea_source.dart';
import 'package:e_commerce/features/cart/data/mappers/cart_mappers.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartLocalDataSource localDataSoyrce;
  final CartRemoteDateaSource remoteDataSource;
  final NetworkInfo networkInfo;

  CartRepoImpl({
    required this.localDataSoyrce,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  String _cartKey(CartItem item) => "${item.id}_${item.size}_${item.color}";

  @override
  Future<Either<CartFailure, void>> addToCart(CartItem cartItem) async {
    try {
      final hiveModel = CartMappers.toHoveModel(cartItem);
      await localDataSoyrce.addCartItem(hiveModel);
      if (await networkInfo.isConnected) {
        try {
          final firastoreModel = CartMappers.toFirestoreModel(cartItem);
          await remoteDataSource.updateServerCart(firastoreModel);
        } catch (e) {
          log('Faild to sync with server');
        }
      }
      return const Right(null);
    } catch (e) {
      return Left(CartLocalFailure(message: 'فشل فى اضافة المنتج $e'));
    }
  }

  @override
  Future<Either<CartFailure, void>> clearCart() async {
    try {
      await localDataSoyrce.cleareCart();
      if (await networkInfo.isConnected) {
        try {
          await remoteDataSource.clearCart();
        } catch (e) {
          log('Faild To clear Cart From Firestore : $e');
        }
      }
      return const Right(null);
    } catch (e) {
      return Left(CartLocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CartFailure, List<CartItem>>> getCartItems() async {
    try {
      final items = await localDataSoyrce.getCartItems();
      final localItems = items
          .map((e) => CartMappers.fromHiveModel(e))
          .toList();
      if (await networkInfo.isConnected) {
        try {
          final serverItems = await remoteDataSource.getServerCart();
          if (serverItems.isNotEmpty) {
            final toLocalItems = serverItems
                .map((item) => CartMappers.firestoreToHiveModel(item))
                .toList();
            final toCartItem = serverItems
                .map((item) => CartMappers.fromFirestoreModel(item))
                .toList();
            await localDataSoyrce.saveCartItems(toLocalItems);
            return Right(toCartItem);
          }
        } catch (e) {
          log('Faild To get Remote Cart Items : $e');
        }
      }
      return Right(localItems);
    } catch (e) {
      return Left(CartLocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CartFailure, int>> getCartItemsCount() async {
    try {
      final items = await localDataSoyrce.getCartItems();
      final count = items.length;
      return Right(count);
    } catch (e) {
      return Left(CartLocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CartFailure, double>> getTotalPrice() async {
    try {
      final items = await localDataSoyrce.getCartItems();
      final price = items.fold<double>(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );
      return Right(price);
    } catch (e) {
      return Left(CartLocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CartFailure, void>> removeFromCart(CartItem cartItem) async {
    try {
      await localDataSoyrce.removeCartItem(CartMappers.toHoveModel(cartItem));
      if (await networkInfo.isConnected) {
        try {
          await remoteDataSource.removeFromCart(
            CartMappers.toFirestoreModel(cartItem),
          );
        } catch (e) {
          log('Faild To Remove Item In Remote Cart : $e');
        }
      }
      return const Right(null);
    } catch (e) {
      return Left(CartLocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CartFailure, void>> updateCartItem(
    CartItem cartItem, {
    int? quantity,
  }) async {
    try {
      final hiveModel = CartMappers.toHoveModel(cartItem);
      await localDataSoyrce.updateCartItem(hiveModel, quantity: quantity);
      if (await networkInfo.isConnected) {
        try {
          final firestoreModel = CartMappers.toFirestoreModel(cartItem);
          await remoteDataSource.updateServerCart(firestoreModel);
        } catch (e) {
          log('Faild To Update Remote Item : $e');
        }
      }
      return const Right(null);
    } catch (e) {
      // log(e.toString());
      return Left(CartLocalFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CartFailure, List<CartItem>>> getServerCart() async {
    try {
      if (!await networkInfo.isConnected) {
        return Left(CartNetworkFailure(message: 'لا يوجد اتصال بالانترنت'));
      }
      final remoteItems = await remoteDataSource.getServerCart();
      final items = remoteItems
          .map((item) => CartMappers.fromFirestoreModel(item))
          .toList();
      return Right(items);
    } catch (e) {
      return Left(CartRemoteFailure(message: 'فشل جلب السله من السرفير'));
    }
  }

  @override
  Future<Either<CartFailure, bool>> isInCart(CartItem cartItem) async {
    try {
      final model = CartMappers.toHoveModel(cartItem);
      final isExisting = await localDataSoyrce.isInCart(model);
      return Right(isExisting);
    } catch (e) {
      return Left(CartLocalFailure(message: 'فشل التحقق من وجود المنتج'));
    }
  }

  @override
  Future<Either<CartFailure, void>> mergeLocalAndServerCart() async {
    try {
      if (!await networkInfo.isConnected) {
        return Left(CartNetworkFailure(message: 'لا يوجد اتصال بالانترنت'));
      }
      final localHiveItems = await localDataSoyrce.getCartItems();
      final serverFirestoreItems = await remoteDataSource.getServerCart();

      final localItems = localHiveItems.map(CartMappers.fromHiveModel).toList();
      final serverItems = serverFirestoreItems
          .map(CartMappers.fromFirestoreModel)
          .toList();

      final mergeMap = <String, CartItem>{};

      for (final localItem in localItems) {
        final key = _cartKey(localItem);
        mergeMap[key] = localItem;
      }

      for (final serverItem in serverItems) {
        final key = _cartKey(serverItem);
        if (mergeMap.containsKey(key)) {
          final localItem = mergeMap[key]!;
          mergeMap[key] = serverItem.copyWith(
            quantity: serverItem.quantity + localItem.quantity,
          );
        } else {
          mergeMap[key] = serverItem;
        }
      }
      final mergedItems = mergeMap.values.toList();

      await localDataSoyrce.saveCartItems(
        mergedItems.map((item) => CartMappers.toHoveModel(item)).toList(),
      );

      await remoteDataSource.syncCart(
        mergedItems.map((item) => CartMappers.toFirestoreModel(item)).toList(),
      );
      return const Right(null);
    } catch (e) {
      return Left(CartRemoteFailure(message: 'فشل دمج العربه'));
    }
  }

  @override
  Future<Either<CartFailure, void>> syncCartWithServerCart(
    List<CartItem> items,
  ) async {
    try {
      if (!await networkInfo.isConnected) {
        return Left(CartNetworkFailure(message: 'لا يوجد اتصال بالانترنت'));
      }
      final models = items
          .map((item) => CartMappers.toFirestoreModel(item))
          .toList();
      await remoteDataSource.syncCart(models);
      return const Right(null);
    } catch (e) {
      return Left(CartRemoteFailure(message: 'فشل فى المزامنه'));
    }
  }
}

// extension CartItemMapper on CartItem {
//   HiveCartItemModel toModel() {
//     return HiveCartItemModel(
//       id: this.id, // علشان فى داله اسمها id داخل ال dartz يتعارض معها
//       name: name,
//       image: image,
//       price: price,
//       quantity: quantity,
//       size: size,
//       color: color,
//       inStock: inStock,
//     );
//   }
// }

// extension CartImtemModelMapper on HiveCartItemModel {
//   CartItem toEntity() {
//     return CartItem(
//       id: this.id,
//       productId: this.id, // تتعدل انا ضايفها كده علشان ال Error فقط
//       name: name,
//       image: image,
//       price: price,
//       quantity: quantity,
//       size: size,
//       color: color,
//       inStock: inStock,
//     );
//   }
// }
