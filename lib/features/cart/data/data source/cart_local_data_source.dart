import 'dart:developer';

import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/cart/data/model/cart_item_model.dart';
import 'package:hive/hive.dart';

abstract class CartLocalDataSource {
  Future<List<CartItemModel>> getAllCartItems();
  Future<void> addCartItem(CartItemModel cartItem);
  Future<void> updateCartItem(CartItemModel cartItem, {int? quantity});
  Future<void> removeCartItem(CartItemModel cartItem);
  Future<void> cleareCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final Box<CartItemModel> box;

  CartLocalDataSourceImpl({required this.box});

  String _cartKey(CartItemModel item) =>
      "${item.id}_${item.size}_${item.color}";
  @override
  Future<void> addCartItem(CartItemModel cartItem) async {
    try {
      final key = _cartKey(cartItem);
      // log(key);
      final existingItem = box.get(key);

      if (existingItem != null) {
        final newQuantity = existingItem.quantity + cartItem.quantity;
        if (newQuantity <= cartItem.stock) {
          final updatedItem = existingItem.copyWith(quantity: newQuantity);
          await box.put(key, updatedItem);
        } else {
          throw Exception("الكمية المطلوبه غير متوفره");
        }
      } else {
        await box.put(key, cartItem);
      }
      return;
    } on HiveError catch (e) {
      throw HiveFailure(e.toString());
    } catch (e) {
      throw Exception("$e : حدث خطأ اثناء اضافة المنتج فى العربه");
    }
  }

  @override
  Future<void> cleareCart() async {
    try {
      await box.clear();
    } on HiveError catch (e) {
      throw HiveFailure(e.toString());
    } catch (e) {
      throw Exception("$e : حدث خطأ اثناء حذف المنتجات");
    }
  }

  @override
  Future<List<CartItemModel>> getAllCartItems() async {
    try {
      return box.values.toList();
    } on HiveError catch (e) {
      throw HiveFailure(e.toString());
    } catch (e) {
      throw Exception("$e : فشل جلب المنتجات ");
    }
  }

  @override
  Future<void> removeCartItem(CartItemModel cartItem) async {
    try {
      await box.delete(_cartKey(cartItem));
    } on HiveError catch (e) {
      throw HiveFailure(e.toString());
    } catch (e) {
      throw Exception("$e : حدث خطأ اثناء حذف المنتج");
    }
  }

  @override
  Future<void> updateCartItem(CartItemModel cartItem, {int? quantity}) async {
    try {
      final existingItem = box.get(_cartKey(cartItem));
      if (existingItem != null) {
        if (quantity != null && quantity > cartItem.stock) {
          throw CacheFailure("الكميه المطلوبه غير متوفره");
        }
        // log("message");
        final updatedItem = existingItem.copyWith(
          quantity: quantity ?? existingItem.quantity,
        );
        await box.put(_cartKey(updatedItem), updatedItem);
      }
    } on CacheFailure {
      rethrow;
    } on HiveError catch (e) {
      // log(e.toString());
      throw HiveFailure(e.toString());
    } catch (e) {
      // log("message 1");
      // log(e.toString());
      throw Exception("$e : حدث خطأ أثناء تحديث المنتج");
    }
  }
}
