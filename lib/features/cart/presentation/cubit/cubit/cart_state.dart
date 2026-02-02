import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_total.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = CartInitial;

  const factory CartState.loading() = CartLoading;

  const factory CartState.loaded({
    required List<CartItem> items,
    required CartTotal total,
    required bool hasChanges,
  }) = CartLoaded;

  const factory CartState.error({
    required String message,
    List<CartItem>? items,
    CartTotal? total,
  }) = CartError;

  const factory CartState.syncing() = CartSyncing;

  const factory CartState.synced({
    required List<CartItem> items,
    required CartTotal total,
  }) = CartSynced;

  const factory CartState.empty() = CartEmpty;
}
