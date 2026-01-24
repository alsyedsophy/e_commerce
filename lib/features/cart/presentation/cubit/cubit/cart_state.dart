part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> items;
  final double totalPrice;
  final int itemsCount;
  final String? errorMessage;
  final String? errorItemId;

  const CartLoaded({
    required this.items,
    required this.totalPrice,
    required this.itemsCount,
    this.errorMessage,
    this.errorItemId,
  });

  CartLoaded copyWith({
    List<CartItem>? items,
    double? totalPrice,
    int? itemsCount,
    String? errorMessage,
    String? errorItemId,
  }) {
    return CartLoaded(
      items: items ?? this.items,
      totalPrice: totalPrice ?? this.totalPrice,
      itemsCount: itemsCount ?? this.itemsCount,
      errorMessage: errorMessage,
      errorItemId: errorItemId,
    );
  }

  @override
  List<Object> get props => [
    items,
    totalPrice,
    itemsCount,
    ?errorMessage,
    ?errorItemId,
  ];
}

class CartError extends CartState {
  final String message;

  const CartError({required this.message});
  @override
  List<Object> get props => [message];
}
