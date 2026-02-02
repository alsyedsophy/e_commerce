import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_total.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repo.dart';
import 'package:e_commerce/features/cart/domain/usecases/add_cart_item_use_case.dart';
import 'package:e_commerce/features/cart/domain/usecases/clear_cart_use_case.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_all_cart_items_use_case.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_cart_item_count_use_case.dart';
import 'package:e_commerce/features/cart/domain/usecases/calculate_total_cart_usecase.dart';
import 'package:e_commerce/features/cart/domain/usecases/remove_cart_item_use_case.dart';
import 'package:e_commerce/features/cart/domain/usecases/update_cart_item_use_case.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final AddCartItemUseCase addCartItemUseCase;
  final ClearCartUseCase clearCartUseCase;
  final GetCartItemsUseCase getAllCartItemsUseCase;
  final GetCartItemCountUseCase getCartItemCountUseCase;
  final CalculateTotalCartUseCasee calculateTotalCartUseCase;
  final RemoveCartItemUseCase removeCartItemUseCase;
  final UpdateCartItemUseCase updateCartItemUseCase;
  final CartRepo cartRepo;
  CartCubit(
    this.addCartItemUseCase,
    this.clearCartUseCase,
    this.getAllCartItemsUseCase,
    this.getCartItemCountUseCase,
    this.calculateTotalCartUseCase,
    this.removeCartItemUseCase,
    this.updateCartItemUseCase,
    this.cartRepo,
  ) : super(CartState.initial()) {
    _loadCart();
  }

  Future<void> _loadCart() async {
    emit(CartState.initial());
    final itemsResult = await getAllCartItemsUseCase.call(NoParams());
    itemsResult.fold(
      (failure) => emit(CartState.error(message: _getErrorMessage(failure))),
      (items) async {
        if (items.isEmpty) {
          emit(CartState.empty());
        } else {
          final totalResult = await calculateTotalCartUseCase.call(
            CalculateTotalCartParm(items: items),
          );

          totalResult.fold(
            (failure) =>
                emit(CartState.error(message: _getErrorMessage(failure))),
            (total) {
              emit(
                CartState.loaded(items: items, total: total, hasChanges: false),
              );
            },
          );
        }
      },
    );
  }

  Future<void> addItemToCart(CartItem item) async {
    final currentState = state;
    List<CartItem> currentItems = [];
    CartTotal? currentTotal;

    if (currentState is CartLoaded) {
      currentItems = currentState.items;
      currentTotal = currentState.total;
    }

    // Optimistic UI
    if (currentState is CartLoaded) {
      final newItems = List<CartItem>.from(currentItems);
      final exsitingIndex = newItems.indexWhere(
        (i) => _cartKey(i) == _cartKey(item),
      );
      if (exsitingIndex != -1) {
        final existingItem = newItems[exsitingIndex];
        newItems[exsitingIndex] = existingItem.copyWith(
          quantity: existingItem.quantity + item.quantity,
        );
      } else {
        newItems.add(item);
      }

      final totalResult = await calculateTotalCartUseCase.call(
        CalculateTotalCartParm(items: newItems),
      );

      totalResult.fold(
        (failure) => emit(
          CartState.error(
            message: _getErrorMessage(failure),
            items: currentItems,
            total: currentTotal,
          ),
        ),
        (newTotal) {
          emit(
            CartState.loaded(
              items: newItems,
              total: newTotal,
              hasChanges: true,
            ),
          );
        },
      );
    } else {
      final result = await addCartItemUseCase.call(
        AddCartItemParams(cartItem: item),
      );

      result.fold(
        (failure) {
          if (currentState is CartLoaded) {
            emit(
              CartState.error(
                message: _getErrorMessage(failure),
                items: currentItems,
                total: currentTotal,
              ),
            );
          }
        },
        (_) {
          if (state is CartLoaded) {
            final loadedState = state as CartLoaded;
            emit(loadedState.copyWith(hasChanges: false));
          }
        },
      );
    }
  }

  Future<void> removeItemFromCart(CartItem cartItem) async {
    final currentState = state;
    if (currentState is! CartLoaded) return;

    final currentItems = currentState.items;
    final currentTotal = currentState.total;

    final newItems = currentItems
        .where((i) => _cartKey(i) != _cartKey(cartItem))
        .toList();
    if (newItems.isEmpty) {
      emit(CartState.empty());
    } else {
      final totalResult = await calculateTotalCartUseCase.call(
        CalculateTotalCartParm(items: newItems),
      );

      totalResult.fold(
        (failure) => emit(
          CartState.error(
            message: _getErrorMessage(failure),
            items: currentItems,
            total: currentTotal,
          ),
        ),
        (newTotal) {
          emit(
            CartState.loaded(
              items: newItems,
              total: newTotal,
              hasChanges: true,
            ),
          );
        },
      );
    }
    final result = await removeCartItemUseCase.call(
      RemoveCartItemParams(cartItem: cartItem),
    );

    result.fold(
      (failure) {
        emit(
          CartState.error(
            message: _getErrorMessage(failure),
            items: currentItems,
            total: currentTotal,
          ),
        );
      },
      (_) {
        final loadedState = state as CartLoaded;
        emit(loadedState.copyWith(hasChanges: false));
      },
    );
  }

  Future<void> updateItemQuantity(CartItem cartItem, int newQuantity) async {
    final currentState = state;
    if (currentState is! CartLoaded) return;

    final currentItems = currentState.items;
    final currentTotal = currentState.total;

    final newItems = List<CartItem>.from(currentItems);
    final existingIndex = newItems.indexWhere(
      (i) => _cartKey(i) == _cartKey(cartItem),
    );
    if (existingIndex != -1) {
      newItems[existingIndex] = newItems[existingIndex].copyWith(
        quantity: newQuantity,
      );

      final totalResult = await calculateTotalCartUseCase.call(
        CalculateTotalCartParm(items: newItems),
      );
      totalResult.fold(
        (failure) => emit(
          CartState.error(
            message: _getErrorMessage(failure),
            items: currentItems,
            total: currentTotal,
          ),
        ),
        (newTotal) => emit(
          CartState.loaded(items: newItems, total: newTotal, hasChanges: true),
        ),
      );
    }
    if (existingIndex != -1) {
      final result = await updateCartItemUseCase.call(
        UpdateCartItemParams(cartItem: cartItem, quantity: newQuantity),
      );

      result.fold(
        (failure) => emit(
          CartState.error(
            message: _getErrorMessage(failure),
            items: currentItems,
            total: currentTotal,
          ),
        ),
        (_) {
          if (state is CartLoaded) {
            final loadedState = state as CartLoaded;
            emit(loadedState.copyWith(hasChanges: false));
          }
        },
      );
    }
  }

  Future<void> clearCart() async {
    emit(CartState.loading());
    final result = await clearCartUseCase.call(NoParams());
    result.fold(
      (failure) => emit(CartState.error(message: _getErrorMessage(failure))),
      (_) => emit(CartState.empty()),
    );
  }

  Future<void> syncWithServer() async {
    final currentState = state;
    if (currentState is! CartLoaded) return;

    emit(CartState.syncing());
    final result = await cartRepo.mergeLocalAndServerCart();
    result.fold(
      (failure) => emit(CartState.error(message: _getErrorMessage(failure))),
      (_) async {
        final resultItems = await getAllCartItemsUseCase.call(NoParams());
        resultItems.fold(
          (failure) =>
              emit(CartState.error(message: _getErrorMessage(failure))),
          (items) async {
            final resultTotal = await calculateTotalCartUseCase.call(
              CalculateTotalCartParm(items: items),
            );

            resultTotal.fold(
              (failure) =>
                  emit(CartState.error(message: _getErrorMessage(failure))),
              (total) {
                emit(CartState.synced(items: items, total: total));

                Future.delayed(
                  Duration(seconds: 2),
                  () => emit(
                    CartState.loaded(
                      items: items,
                      total: total,
                      hasChanges: false,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Future<int> getCartItemCount() async {
    final result = await getCartItemCountUseCase.call(NoParams());
    return result.fold((failure) => 0, (count) => count);
  }

  String _cartKey(CartItem item) => "${item.id}_${item.size}_${item.color}";

  String _getErrorMessage(CartFailure failure) {
    return switch (failure) {
      CartLocalFailure(message: final message) => message,
      CartRemoteFailure(message: final message) => message,
      CartNetworkFailure(message: final message) => message,
      CartValidationFailure(message: final message) => message,
    };
  }
}
