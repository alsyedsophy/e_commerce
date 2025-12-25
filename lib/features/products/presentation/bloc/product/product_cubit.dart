// import 'dart:developer';

// import 'package:e_commerce/features/products/domain/usecases/get_all_products_usecase.dart';
// import 'package:e_commerce/features/products/domain/usecases/get_featured_product_usecse.dart';
// import 'package:e_commerce/features/products/domain/usecases/get_new_products_usecase.dart';
// import 'package:e_commerce/features/products/domain/usecases/get_product_by_id_usecase.dart';
// import 'package:e_commerce/features/products/domain/usecases/get_products_by_category_usecase.dart';
// import 'package:e_commerce/features/products/domain/usecases/search_product_usecase.dart';
// import 'package:e_commerce/features/products/presentation/bloc/product/product_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductCubit extends Cubit<ProductState> {
//   final GetAllProductsUsecase getAllProductsUsecase;
//   final GetFeaturedProductUsecse getFeaturedProductUsecse;
//   final GetNewProductsUsecase getNewProductsUsecase;
//   final GetProductByIdUsecase getProductByIdUsecase;
//   final GetProductsByCategoryUsecase getProductsByCategoryUsecase;
//   final SearchProductUsecase searchProductUsecase;
//   ProductCubit(
//     this.getAllProductsUsecase,
//     this.getFeaturedProductUsecse,
//     this.getNewProductsUsecase,
//     this.getProductByIdUsecase,
//     this.getProductsByCategoryUsecase,
//     this.searchProductUsecase,
//   ) : super(ProductInit());

//   // جلب جكيع المنتجات
//   Future<void> getAllProducts({int limit = 20}) async {
//     emit(ProductLoading());
//     final result = await getAllProductsUsecase.call(
//       GetAllProductsParams(limit, null),
//     );
//     result.fold((failure) => emit(ProductError(message: failure.message)), (
//       products,
//     ) {
//       emit(
//         ProductsLoaded(
//           products: products,
//           hasReachedMax: products.length < limit,
//           lastDocumentId: products.isNotEmpty ? products.last.id : null,
//         ),
//       );
//     });
//   }

//   // جلب المنتجات المميزه
//   Future<void> getFeatureProducts({int limit = 10}) async {
//     emit(ProductLoading());
//     final result = await getFeaturedProductUsecse.call(
//       GetFeaturedProductParams(limit),
//     );

//     result.fold((failure) {
//       log(failure.message);
//       emit(ProductError(message: failure.message));
//     }, (products) => emit(FeaturedProductsLoaded(products: products)));
//   }

//   // جلب المنتحات الجديده
//   Future<void> getNewProducts({int limit = 20}) async {
//     emit(ProductLoading());
//     final result = await getNewProductsUsecase.call(
//       GetNewProductsParams(limit),
//     );

//     result.fold(
//       (failure) => emit(ProductError(message: failure.message)),
//       (products) => emit(NewProductsLoaded(products: products)),
//     );
//   }

//   // جلب المنتجات التابعه لفئه معينه
//   Future<void> getProductsByCategory(
//     String categoryId, {
//     int limit = 20,
//   }) async {
//     emit(ProductLoading());
//     final result = await getProductsByCategoryUsecase.call(
//       GetProductsByCategoryParams(categoryId, limit),
//     );

//     result.fold(
//       (failure) => emit(ProductError(message: failure.message)),
//       (products) => emit(
//         ProductsLoaded(
//           products: products,
//           hasReachedMax: products.length < limit,
//         ),
//       ),
//     );
//   }

//   // جلب منتج معين بتفاصيله
//   Future<void> getProductById(String productId) async {
//     emit(ProductLoading());
//     final result = await getProductByIdUsecase.call(
//       GetProductByIdParams(productId),
//     );
//     result.fold(
//       (failure) => emit(ProductError(message: failure.message)),
//       (product) => emit(ProductDetailLoaded(product: product)),
//     );
//   }

//   // البحث عن منتح معين
//   Future<void> searchProduct(String query) async {
//     emit(ProductLoading());
//     final result = await searchProductUsecase.call(SearchProductParams(query));
//     result.fold(
//       (failure) => emit(ProductError(message: failure.message)),
//       (products) => emit(ProductsLoaded(products: products)),
//     );
//   }

//   // التحميل الاضافى
//   Future<void> loadMoreProducts() async {
//     final currentState = state;
//     if (currentState is ProductsLoaded) {
//       if (currentState.hasReachedMax) return;

//       emit(ProductLoading());
//       final result = await getAllProductsUsecase.call(
//         GetAllProductsParams(20, currentState.lastDocumentId),
//       );

//       result.fold((failure) => emit(ProductError(message: failure.message)), (
//         newProducts,
//       ) {
//         if (newProducts.isEmpty) {
//           emit(currentState.copyWith(hasReachedMax: true));
//         } else {
//           final allProducts = [...currentState.products, ...newProducts];
//           emit(
//             ProductsLoaded(
//               products: allProducts,
//               hasReachedMax: newProducts.length < 20,
//               lastDocumentId: newProducts.last.id,
//             ),
//           );
//         }
//       });
//     }
//   }
// }

import 'package:e_commerce/features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/get_featured_product_usecse.dart';
import 'package:e_commerce/features/products/domain/usecases/get_new_products_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/get_product_by_id_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/get_products_by_category_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/search_product_usecase.dart';
import 'package:e_commerce/features/products/presentation/bloc/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {
  final GetAllProductsUsecase getAllProductsUsecase;
  final GetFeaturedProductUsecse getFeaturedProductUsecse;
  final GetNewProductsUsecase getNewProductsUsecase;
  final GetProductByIdUsecase getProductByIdUsecase;
  final GetProductsByCategoryUsecase getProductsByCategoryUsecase;
  final SearchProductUsecase searchProductUsecase;
  String? lastDocumentId;
  bool hasRechedMax = false;
  ProductCubit(
    this.getAllProductsUsecase,
    this.getFeaturedProductUsecse,
    this.getNewProductsUsecase,
    this.getProductByIdUsecase,
    this.getProductsByCategoryUsecase,
    this.searchProductUsecase,
  ) : super(const ProductStates());

  Future<void> getAllProducts({int limit = 20}) async {
    emit(state.copyWith(isLoading: true));
    final result = await getAllProductsUsecase.call(
      GetAllProductsParams(limit, null),
    );

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (products) => emit(state.copyWith(isLoading: false, products: products)),
    );
  }

  Future<void> getFeaturedProduct({int limit = 10}) async {
    emit(state.copyWith(isFeatureLoading: true));
    final result = await getFeaturedProductUsecse.call(
      GetFeaturedProductParams(limit),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(isFeatureLoading: false, errorMessage: failure.message),
      ),
      (products) => emit(
        state.copyWith(isFeatureLoading: false, featuredProduct: products),
      ),
    );
  }

  Future<void> searchProduct(String query) async {
    if (query.isEmpty) {
      emit(state.copyWith(isSearch: false, query: '', searchProduct: const []));
      return;
    }
    emit(state.copyWith(isSearch: true, query: '', isSearchLoading: true));
    final result = await searchProductUsecase.call(SearchProductParams(query));

    result.fold(
      (failure) => emit(
        state.copyWith(isSearchLoading: false, errorMessage: failure.message),
      ),
      (products) =>
          emit(state.copyWith(isSearchLoading: false, searchProduct: products)),
    );
  }

  Future<void> getNewProduct({int limit = 10}) async {
    emit(state.copyWith(isNewLoading: true));
    final result = await getNewProductsUsecase.call(
      GetNewProductsParams(limit),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(isNewLoading: false, errorMessage: failure.message),
      ),
      (products) {
        lastDocumentId = products.isNotEmpty ? products.last.id : null;
        hasRechedMax = products.length < limit;

        emit(state.copyWith(isNewLoading: false, newProduct: products));
      },
    );
  }

  Future<void> getProductByCategory(String categoryId, {int limit = 20}) async {
    emit(state.copyWith(isLoading: true));
    final result = await getProductsByCategoryUsecase.call(
      GetProductsByCategoryParams(categoryId, limit),
    );

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (products) => emit(state.copyWith(isLoading: false, products: products)),
    );
  }

  Future<void> loadMore() async {
    if (hasRechedMax || state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final result = await getAllProductsUsecase.call(
      GetAllProductsParams(20, lastDocumentId),
    );

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (newProducts) {
        if (newProducts.isEmpty) {
          hasRechedMax = true;
          emit(state.copyWith(isLoading: false));
        } else {
          lastDocumentId = newProducts.last.id;
          hasRechedMax = newProducts.length < 20;
          emit(
            state.copyWith(
              isLoading: false,
              products: [...state.products, ...newProducts],
            ),
          );
        }
      },
    );
  }

  Future<void> refrechHome() async {
    await Future.wait([getFeaturedProduct(), getNewProduct()]);
  }
}
