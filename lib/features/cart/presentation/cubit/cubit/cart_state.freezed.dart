// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CartItem> items, CartTotal total, bool hasChanges)
        loaded,
    required TResult Function(
            String message, List<CartItem>? items, CartTotal? total)
        error,
    required TResult Function() syncing,
    required TResult Function(List<CartItem> items, CartTotal total) synced,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult? Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult? Function()? syncing,
    TResult? Function(List<CartItem> items, CartTotal total)? synced,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult Function()? syncing,
    TResult Function(List<CartItem> items, CartTotal total)? synced,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartInitial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartLoaded value) loaded,
    required TResult Function(CartError value) error,
    required TResult Function(CartSyncing value) syncing,
    required TResult Function(CartSynced value) synced,
    required TResult Function(CartEmpty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartInitial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartLoaded value)? loaded,
    TResult? Function(CartError value)? error,
    TResult? Function(CartSyncing value)? syncing,
    TResult? Function(CartSynced value)? synced,
    TResult? Function(CartEmpty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartInitial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartLoaded value)? loaded,
    TResult Function(CartError value)? error,
    TResult Function(CartSyncing value)? syncing,
    TResult Function(CartSynced value)? synced,
    TResult Function(CartEmpty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CartInitialImplCopyWith<$Res> {
  factory _$$CartInitialImplCopyWith(
          _$CartInitialImpl value, $Res Function(_$CartInitialImpl) then) =
      __$$CartInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartInitialImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartInitialImpl>
    implements _$$CartInitialImplCopyWith<$Res> {
  __$$CartInitialImplCopyWithImpl(
      _$CartInitialImpl _value, $Res Function(_$CartInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CartInitialImpl implements CartInitial {
  const _$CartInitialImpl();

  @override
  String toString() {
    return 'CartState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CartItem> items, CartTotal total, bool hasChanges)
        loaded,
    required TResult Function(
            String message, List<CartItem>? items, CartTotal? total)
        error,
    required TResult Function() syncing,
    required TResult Function(List<CartItem> items, CartTotal total) synced,
    required TResult Function() empty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult? Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult? Function()? syncing,
    TResult? Function(List<CartItem> items, CartTotal total)? synced,
    TResult? Function()? empty,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult Function()? syncing,
    TResult Function(List<CartItem> items, CartTotal total)? synced,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartInitial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartLoaded value) loaded,
    required TResult Function(CartError value) error,
    required TResult Function(CartSyncing value) syncing,
    required TResult Function(CartSynced value) synced,
    required TResult Function(CartEmpty value) empty,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartInitial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartLoaded value)? loaded,
    TResult? Function(CartError value)? error,
    TResult? Function(CartSyncing value)? syncing,
    TResult? Function(CartSynced value)? synced,
    TResult? Function(CartEmpty value)? empty,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartInitial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartLoaded value)? loaded,
    TResult Function(CartError value)? error,
    TResult Function(CartSyncing value)? syncing,
    TResult Function(CartSynced value)? synced,
    TResult Function(CartEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CartInitial implements CartState {
  const factory CartInitial() = _$CartInitialImpl;
}

/// @nodoc
abstract class _$$CartLoadingImplCopyWith<$Res> {
  factory _$$CartLoadingImplCopyWith(
          _$CartLoadingImpl value, $Res Function(_$CartLoadingImpl) then) =
      __$$CartLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartLoadingImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartLoadingImpl>
    implements _$$CartLoadingImplCopyWith<$Res> {
  __$$CartLoadingImplCopyWithImpl(
      _$CartLoadingImpl _value, $Res Function(_$CartLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CartLoadingImpl implements CartLoading {
  const _$CartLoadingImpl();

  @override
  String toString() {
    return 'CartState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CartItem> items, CartTotal total, bool hasChanges)
        loaded,
    required TResult Function(
            String message, List<CartItem>? items, CartTotal? total)
        error,
    required TResult Function() syncing,
    required TResult Function(List<CartItem> items, CartTotal total) synced,
    required TResult Function() empty,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult? Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult? Function()? syncing,
    TResult? Function(List<CartItem> items, CartTotal total)? synced,
    TResult? Function()? empty,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult Function()? syncing,
    TResult Function(List<CartItem> items, CartTotal total)? synced,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartInitial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartLoaded value) loaded,
    required TResult Function(CartError value) error,
    required TResult Function(CartSyncing value) syncing,
    required TResult Function(CartSynced value) synced,
    required TResult Function(CartEmpty value) empty,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartInitial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartLoaded value)? loaded,
    TResult? Function(CartError value)? error,
    TResult? Function(CartSyncing value)? syncing,
    TResult? Function(CartSynced value)? synced,
    TResult? Function(CartEmpty value)? empty,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartInitial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartLoaded value)? loaded,
    TResult Function(CartError value)? error,
    TResult Function(CartSyncing value)? syncing,
    TResult Function(CartSynced value)? synced,
    TResult Function(CartEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CartLoading implements CartState {
  const factory CartLoading() = _$CartLoadingImpl;
}

/// @nodoc
abstract class _$$CartLoadedImplCopyWith<$Res> {
  factory _$$CartLoadedImplCopyWith(
          _$CartLoadedImpl value, $Res Function(_$CartLoadedImpl) then) =
      __$$CartLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CartItem> items, CartTotal total, bool hasChanges});
}

/// @nodoc
class __$$CartLoadedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartLoadedImpl>
    implements _$$CartLoadedImplCopyWith<$Res> {
  __$$CartLoadedImplCopyWithImpl(
      _$CartLoadedImpl _value, $Res Function(_$CartLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? hasChanges = null,
  }) {
    return _then(_$CartLoadedImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as CartTotal,
      hasChanges: null == hasChanges
          ? _value.hasChanges
          : hasChanges // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CartLoadedImpl implements CartLoaded {
  const _$CartLoadedImpl(
      {required final List<CartItem> items,
      required this.total,
      required this.hasChanges})
      : _items = items;

  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final CartTotal total;
  @override
  final bool hasChanges;

  @override
  String toString() {
    return 'CartState.loaded(items: $items, total: $total, hasChanges: $hasChanges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartLoadedImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasChanges, hasChanges) ||
                other.hasChanges == hasChanges));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), total, hasChanges);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartLoadedImplCopyWith<_$CartLoadedImpl> get copyWith =>
      __$$CartLoadedImplCopyWithImpl<_$CartLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CartItem> items, CartTotal total, bool hasChanges)
        loaded,
    required TResult Function(
            String message, List<CartItem>? items, CartTotal? total)
        error,
    required TResult Function() syncing,
    required TResult Function(List<CartItem> items, CartTotal total) synced,
    required TResult Function() empty,
  }) {
    return loaded(items, total, hasChanges);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult? Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult? Function()? syncing,
    TResult? Function(List<CartItem> items, CartTotal total)? synced,
    TResult? Function()? empty,
  }) {
    return loaded?.call(items, total, hasChanges);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult Function()? syncing,
    TResult Function(List<CartItem> items, CartTotal total)? synced,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items, total, hasChanges);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartInitial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartLoaded value) loaded,
    required TResult Function(CartError value) error,
    required TResult Function(CartSyncing value) syncing,
    required TResult Function(CartSynced value) synced,
    required TResult Function(CartEmpty value) empty,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartInitial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartLoaded value)? loaded,
    TResult? Function(CartError value)? error,
    TResult? Function(CartSyncing value)? syncing,
    TResult? Function(CartSynced value)? synced,
    TResult? Function(CartEmpty value)? empty,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartInitial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartLoaded value)? loaded,
    TResult Function(CartError value)? error,
    TResult Function(CartSyncing value)? syncing,
    TResult Function(CartSynced value)? synced,
    TResult Function(CartEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class CartLoaded implements CartState {
  const factory CartLoaded(
      {required final List<CartItem> items,
      required final CartTotal total,
      required final bool hasChanges}) = _$CartLoadedImpl;

  List<CartItem> get items;
  CartTotal get total;
  bool get hasChanges;
  @JsonKey(ignore: true)
  _$$CartLoadedImplCopyWith<_$CartLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartErrorImplCopyWith<$Res> {
  factory _$$CartErrorImplCopyWith(
          _$CartErrorImpl value, $Res Function(_$CartErrorImpl) then) =
      __$$CartErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, List<CartItem>? items, CartTotal? total});
}

/// @nodoc
class __$$CartErrorImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartErrorImpl>
    implements _$$CartErrorImplCopyWith<$Res> {
  __$$CartErrorImplCopyWithImpl(
      _$CartErrorImpl _value, $Res Function(_$CartErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? items = freezed,
    Object? total = freezed,
  }) {
    return _then(_$CartErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as CartTotal?,
    ));
  }
}

/// @nodoc

class _$CartErrorImpl implements CartError {
  const _$CartErrorImpl(
      {required this.message, final List<CartItem>? items, this.total})
      : _items = items;

  @override
  final String message;
  final List<CartItem>? _items;
  @override
  List<CartItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CartTotal? total;

  @override
  String toString() {
    return 'CartState.error(message: $message, items: $items, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_items), total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartErrorImplCopyWith<_$CartErrorImpl> get copyWith =>
      __$$CartErrorImplCopyWithImpl<_$CartErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CartItem> items, CartTotal total, bool hasChanges)
        loaded,
    required TResult Function(
            String message, List<CartItem>? items, CartTotal? total)
        error,
    required TResult Function() syncing,
    required TResult Function(List<CartItem> items, CartTotal total) synced,
    required TResult Function() empty,
  }) {
    return error(message, items, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult? Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult? Function()? syncing,
    TResult? Function(List<CartItem> items, CartTotal total)? synced,
    TResult? Function()? empty,
  }) {
    return error?.call(message, items, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult Function()? syncing,
    TResult Function(List<CartItem> items, CartTotal total)? synced,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, items, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartInitial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartLoaded value) loaded,
    required TResult Function(CartError value) error,
    required TResult Function(CartSyncing value) syncing,
    required TResult Function(CartSynced value) synced,
    required TResult Function(CartEmpty value) empty,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartInitial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartLoaded value)? loaded,
    TResult? Function(CartError value)? error,
    TResult? Function(CartSyncing value)? syncing,
    TResult? Function(CartSynced value)? synced,
    TResult? Function(CartEmpty value)? empty,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartInitial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartLoaded value)? loaded,
    TResult Function(CartError value)? error,
    TResult Function(CartSyncing value)? syncing,
    TResult Function(CartSynced value)? synced,
    TResult Function(CartEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CartError implements CartState {
  const factory CartError(
      {required final String message,
      final List<CartItem>? items,
      final CartTotal? total}) = _$CartErrorImpl;

  String get message;
  List<CartItem>? get items;
  CartTotal? get total;
  @JsonKey(ignore: true)
  _$$CartErrorImplCopyWith<_$CartErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartSyncingImplCopyWith<$Res> {
  factory _$$CartSyncingImplCopyWith(
          _$CartSyncingImpl value, $Res Function(_$CartSyncingImpl) then) =
      __$$CartSyncingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartSyncingImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartSyncingImpl>
    implements _$$CartSyncingImplCopyWith<$Res> {
  __$$CartSyncingImplCopyWithImpl(
      _$CartSyncingImpl _value, $Res Function(_$CartSyncingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CartSyncingImpl implements CartSyncing {
  const _$CartSyncingImpl();

  @override
  String toString() {
    return 'CartState.syncing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartSyncingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CartItem> items, CartTotal total, bool hasChanges)
        loaded,
    required TResult Function(
            String message, List<CartItem>? items, CartTotal? total)
        error,
    required TResult Function() syncing,
    required TResult Function(List<CartItem> items, CartTotal total) synced,
    required TResult Function() empty,
  }) {
    return syncing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult? Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult? Function()? syncing,
    TResult? Function(List<CartItem> items, CartTotal total)? synced,
    TResult? Function()? empty,
  }) {
    return syncing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult Function()? syncing,
    TResult Function(List<CartItem> items, CartTotal total)? synced,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartInitial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartLoaded value) loaded,
    required TResult Function(CartError value) error,
    required TResult Function(CartSyncing value) syncing,
    required TResult Function(CartSynced value) synced,
    required TResult Function(CartEmpty value) empty,
  }) {
    return syncing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartInitial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartLoaded value)? loaded,
    TResult? Function(CartError value)? error,
    TResult? Function(CartSyncing value)? syncing,
    TResult? Function(CartSynced value)? synced,
    TResult? Function(CartEmpty value)? empty,
  }) {
    return syncing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartInitial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartLoaded value)? loaded,
    TResult Function(CartError value)? error,
    TResult Function(CartSyncing value)? syncing,
    TResult Function(CartSynced value)? synced,
    TResult Function(CartEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (syncing != null) {
      return syncing(this);
    }
    return orElse();
  }
}

abstract class CartSyncing implements CartState {
  const factory CartSyncing() = _$CartSyncingImpl;
}

/// @nodoc
abstract class _$$CartSyncedImplCopyWith<$Res> {
  factory _$$CartSyncedImplCopyWith(
          _$CartSyncedImpl value, $Res Function(_$CartSyncedImpl) then) =
      __$$CartSyncedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CartItem> items, CartTotal total});
}

/// @nodoc
class __$$CartSyncedImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartSyncedImpl>
    implements _$$CartSyncedImplCopyWith<$Res> {
  __$$CartSyncedImplCopyWithImpl(
      _$CartSyncedImpl _value, $Res Function(_$CartSyncedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
  }) {
    return _then(_$CartSyncedImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as CartTotal,
    ));
  }
}

/// @nodoc

class _$CartSyncedImpl implements CartSynced {
  const _$CartSyncedImpl(
      {required final List<CartItem> items, required this.total})
      : _items = items;

  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final CartTotal total;

  @override
  String toString() {
    return 'CartState.synced(items: $items, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartSyncedImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartSyncedImplCopyWith<_$CartSyncedImpl> get copyWith =>
      __$$CartSyncedImplCopyWithImpl<_$CartSyncedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CartItem> items, CartTotal total, bool hasChanges)
        loaded,
    required TResult Function(
            String message, List<CartItem>? items, CartTotal? total)
        error,
    required TResult Function() syncing,
    required TResult Function(List<CartItem> items, CartTotal total) synced,
    required TResult Function() empty,
  }) {
    return synced(items, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult? Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult? Function()? syncing,
    TResult? Function(List<CartItem> items, CartTotal total)? synced,
    TResult? Function()? empty,
  }) {
    return synced?.call(items, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult Function()? syncing,
    TResult Function(List<CartItem> items, CartTotal total)? synced,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced(items, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartInitial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartLoaded value) loaded,
    required TResult Function(CartError value) error,
    required TResult Function(CartSyncing value) syncing,
    required TResult Function(CartSynced value) synced,
    required TResult Function(CartEmpty value) empty,
  }) {
    return synced(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartInitial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartLoaded value)? loaded,
    TResult? Function(CartError value)? error,
    TResult? Function(CartSyncing value)? syncing,
    TResult? Function(CartSynced value)? synced,
    TResult? Function(CartEmpty value)? empty,
  }) {
    return synced?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartInitial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartLoaded value)? loaded,
    TResult Function(CartError value)? error,
    TResult Function(CartSyncing value)? syncing,
    TResult Function(CartSynced value)? synced,
    TResult Function(CartEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced(this);
    }
    return orElse();
  }
}

abstract class CartSynced implements CartState {
  const factory CartSynced(
      {required final List<CartItem> items,
      required final CartTotal total}) = _$CartSyncedImpl;

  List<CartItem> get items;
  CartTotal get total;
  @JsonKey(ignore: true)
  _$$CartSyncedImplCopyWith<_$CartSyncedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartEmptyImplCopyWith<$Res> {
  factory _$$CartEmptyImplCopyWith(
          _$CartEmptyImpl value, $Res Function(_$CartEmptyImpl) then) =
      __$$CartEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CartEmptyImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartEmptyImpl>
    implements _$$CartEmptyImplCopyWith<$Res> {
  __$$CartEmptyImplCopyWithImpl(
      _$CartEmptyImpl _value, $Res Function(_$CartEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CartEmptyImpl implements CartEmpty {
  const _$CartEmptyImpl();

  @override
  String toString() {
    return 'CartState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CartEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<CartItem> items, CartTotal total, bool hasChanges)
        loaded,
    required TResult Function(
            String message, List<CartItem>? items, CartTotal? total)
        error,
    required TResult Function() syncing,
    required TResult Function(List<CartItem> items, CartTotal total) synced,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult? Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult? Function()? syncing,
    TResult? Function(List<CartItem> items, CartTotal total)? synced,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CartItem> items, CartTotal total, bool hasChanges)?
        loaded,
    TResult Function(String message, List<CartItem>? items, CartTotal? total)?
        error,
    TResult Function()? syncing,
    TResult Function(List<CartItem> items, CartTotal total)? synced,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CartInitial value) initial,
    required TResult Function(CartLoading value) loading,
    required TResult Function(CartLoaded value) loaded,
    required TResult Function(CartError value) error,
    required TResult Function(CartSyncing value) syncing,
    required TResult Function(CartSynced value) synced,
    required TResult Function(CartEmpty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CartInitial value)? initial,
    TResult? Function(CartLoading value)? loading,
    TResult? Function(CartLoaded value)? loaded,
    TResult? Function(CartError value)? error,
    TResult? Function(CartSyncing value)? syncing,
    TResult? Function(CartSynced value)? synced,
    TResult? Function(CartEmpty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CartInitial value)? initial,
    TResult Function(CartLoading value)? loading,
    TResult Function(CartLoaded value)? loaded,
    TResult Function(CartError value)? error,
    TResult Function(CartSyncing value)? syncing,
    TResult Function(CartSynced value)? synced,
    TResult Function(CartEmpty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class CartEmpty implements CartState {
  const factory CartEmpty() = _$CartEmptyImpl;
}
