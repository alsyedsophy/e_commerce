// import 'package:e_commerce/features/products/domain/entities/product.dart';
// import 'package:equatable/equatable.dart';

// abstract class ProductState extends Equatable {
//   const ProductState();

//   @override
//   List<Object?> get props => [];
// }

// class ProductInit extends ProductState {}

// class ProductLoading extends ProductState {}

// class ProductsLoaded extends ProductState {
//   final List<Product> products;
//   final String? lastDocumentId;
//   final bool hasReachedMax;

//   const ProductsLoaded({
//     required this.products,
//     this.lastDocumentId,
//     this.hasReachedMax = false,
//   });

//   ProductsLoaded copyWith({
//     List<Product>? products,
//     String? lastDocumentId,
//     bool? hasReachedMax,
//   }) {
//     return ProductsLoaded(
//       products: products ?? this.products,
//       lastDocumentId: lastDocumentId ?? this.lastDocumentId,
//       hasReachedMax: hasReachedMax ?? this.hasReachedMax,
//     );
//   }

//   @override
//   List<Object?> get props => [products, lastDocumentId, hasReachedMax];
// }

// class FeaturedProductsLoaded extends ProductState {
//   final List<Product> products;

//   const FeaturedProductsLoaded({required this.products});
//   @override
//   List<Object?> get props => [products];
// }

// class ProductDetailLoaded extends ProductState {
//   final Product product;

//   const ProductDetailLoaded({required this.product});
//   @override
//   List<Object?> get props => [product];
// }

// class NewProductsLoaded extends ProductState {
//   final List<Product> products;

//   const NewProductsLoaded({required this.products});
//   @override
//   List<Object?> get props => [products];
// }

// class ProductError extends ProductState {
//   final String message;

//   const ProductError({required this.message});
//   @override
//   List<Object?> get props => [message];
// }

import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

class ProductStates extends Equatable {
  final bool isLoading;
  final bool isFeatureLoading;
  final bool isNewLoading;
  final bool isSearchLoading;
  final List<Product> featuredProduct;
  final List<Product> newProduct;
  final List<Product> products;
  final bool isSearch;
  final String query;
  final List<Product> searchProduct;
  final String? errorMessage;

  const ProductStates({
    this.isLoading = false,
    this.isFeatureLoading = false,
    this.isNewLoading = false,
    this.isSearchLoading = false,
    this.featuredProduct = const [],
    this.newProduct = const [],
    this.products = const [],
    this.isSearch = false,
    this.query = '',
    this.searchProduct = const [],
    this.errorMessage,
  });

  ProductStates copyWith({
    bool? isLoading,
    bool? isFeatureLoading,
    bool? isNewLoading,
    bool? isSearchLoading,
    List<Product>? featuredProduct,
    List<Product>? newProduct,
    List<Product>? products,
    bool? isSearch,
    String? query,
    List<Product>? searchProduct,
    String? errorMessage,
  }) {
    return ProductStates(
      isLoading: isLoading ?? this.isLoading,
      isFeatureLoading: isFeatureLoading ?? this.isFeatureLoading,
      isNewLoading: isNewLoading ?? this.isNewLoading,
      isSearchLoading: isSearchLoading ?? this.isSearchLoading,
      featuredProduct: featuredProduct ?? this.featuredProduct,
      newProduct: newProduct ?? this.newProduct,
      products: products ?? this.products,
      isSearch: isSearch ?? this.isSearch,
      query: query ?? this.query,
      searchProduct: searchProduct ?? this.searchProduct,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isFeatureLoading,
    isNewLoading,
    isSearchLoading,
    featuredProduct,
    newProduct,
    products,
    isSearch,
    query,
    searchProduct,
    errorMessage,
  ];
}
