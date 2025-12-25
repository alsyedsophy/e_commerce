import 'package:e_commerce/features/products/domain/entities/cateroty.dart';
import 'package:e_commerce/features/products/domain/usecases/get_category_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoryUsecase getCategoryUsecase;
  CategoryCubit(this.getCategoryUsecase) : super(CategoryInitial());

  Future<void> getCategories({int limit = 10}) async {
    emit(CategoryLoading());
    final result = await getCategoryUsecase.call(GetCategoryParams(limit));

    result.fold(
      (failure) => emit(CategoryError(message: failure.message)),
      (categories) => emit(CategoryLoaded(categories: categories)),
    );
  }
}
