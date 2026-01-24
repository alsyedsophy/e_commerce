// import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/usecases/add_cart_item_use_case.dart';
import 'package:e_commerce/features/cart/domain/usecases/clear_cart_use_case.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_all_cart_items_use_case.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_cart_item_count_use_case.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_total_price_use_case.dart';
import 'package:e_commerce/features/cart/domain/usecases/remove_cart_item_use_case.dart';
import 'package:e_commerce/features/cart/domain/usecases/update_cart_item_use_case.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final AddCartItemUseCase addCartItemUseCase;
  final ClearCartUseCase clearCartUseCase;
  final GetAllCartItemsUseCase getAllCartItemsUseCase;
  final GetCartItemCountUseCase getCartItemCountUseCase;
  final GetTotalPriceUseCase getTotalPriceUseCase;
  final RemoveCartItemUseCase removeCartItemUseCase;
  final UpdateCartItemUseCase updateCartItemUseCase;
  CartCubit(
    this.addCartItemUseCase,
    this.clearCartUseCase,
    this.getAllCartItemsUseCase,
    this.getCartItemCountUseCase,
    this.getTotalPriceUseCase,
    this.removeCartItemUseCase,
    this.updateCartItemUseCase,
  ) : super(CartInitial());

  Future<void> _emitLoaddedState() async {
    final Either<Failures, List<CartItem>> itemsResult =
        await getAllCartItemsUseCase.call(NoParams());
    final Either<Failures, double> totalPriceResult = await getTotalPriceUseCase
        .call(NoParams());
    final Either<Failures, int> countResult = await getCartItemCountUseCase
        .call(NoParams());
    itemsResult.fold((failure) => emit(CartError(message: failure.message)), (
      items,
    ) {
      totalPriceResult.fold(
        (failure) => emit(CartError(message: failure.message)),
        (totalPrice) {
          countResult.fold(
            (failure) => emit(CartError(message: failure.message)),
            (count) {
              // log(count.toString());
              emit(
                CartLoaded(
                  items: items,
                  totalPrice: totalPrice,
                  itemsCount: count,
                ),
              );
            },
          );
        },
      );
    });
  }

  Future<void> loadCart() async {
    await _emitLoaddedState();
  }

  Future<void> addItem(CartItem cartItem) async {
    emit(CartLoading());
    final result = await addCartItemUseCase.call(
      AddCartItemParams(cartItem: cartItem),
    );

    result.fold((failure) {
      emit(CartError(message: failure.message));
    }, (_) => _emitLoaddedState());
  }

  Future<void> updateQuantity(CartItem cartItem, {int? newQuantity}) async {
    final currentState = state;
    if (currentState is! CartLoaded) return;

    final result = await updateCartItemUseCase.call(
      UpdateCartItemParams(cartItem: cartItem, quantity: newQuantity),
    );
    result.fold(
      (failure) {
        emit(
          currentState.copyWith(
            errorMessage: failure.message,
            errorItemId: cartItem.id,
          ),
        );
      },
      (_) async {
        await _emitLoaddedState();
      },
    );
  }

  Future<void> removeItem(CartItem cartItem) async {
    emit(CartLoading());
    final result = await removeCartItemUseCase.call(
      RemoveCartItemParams(cartItem: cartItem),
    );
    result.fold(
      (failure) => emit(CartError(message: failure.message)),
      (_) => _emitLoaddedState(),
    );
  }

  Future<void> clearCart() async {
    emit(CartLoading());
    final result = await clearCartUseCase.call(NoParams());
    // log(result.toString());
    result.fold(
      (failure) => emit(CartError(message: failure.message)),
      (_) => emit(CartLoaded(items: [], totalPrice: 0, itemsCount: 0)),
    );
  }

  Future<void> totalPrice() async {
    final currentState = state;
    if (currentState is! CartLoaded) return;
    final result = await getTotalPriceUseCase.call(NoParams());
    result.fold(
      (failure) {
        emit(CartError(message: failure.message));
      },
      (totalPrice) {
        emit(currentState.copyWith(totalPrice: totalPrice));
      },
    );
  }

  void clearErrorMessage() {
    final currentState = state;
    if (currentState is CartLoaded) {
      currentState.copyWith(errorMessage: null, errorItemId: null);
    }
  }
}
