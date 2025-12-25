import 'dart:developer';

import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/routing/app_routs.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/features/products/presentation/bloc/category/category_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/product/product_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/product/product_state.dart';
import 'package:e_commerce/features/products/presentation/widgets/categories_widget.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_section_title.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeResultView extends StatelessWidget {
  const HomeResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          CustomSectionTitle(
            title: AppConstants.categories,
            onPressed: () => context.pushNamed(AppRouts.categoriesScreen),
          ),
          Gap(AppDimens.h_16.h),
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoaded) {
                return CategoriesWidget(state: state);
              }
              if (state is CategoryError) {
                return Center(child: Text(state.message));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
          Gap(AppDimens.h_24.h),
          // Featured Products
          CustomSectionTitle(title: AppConstants.featured, onPressed: () {}),
          Gap(AppDimens.h_16.h),
          BlocBuilder<ProductCubit, ProductStates>(
            buildWhen: (previous, current) =>
                previous.featuredProduct != current.featuredProduct ||
                previous.isFeatureLoading != current.isFeatureLoading,
            builder: (context, state) {
              log("Featured state $state");
              if (state.featuredProduct.isNotEmpty) {
                return SizedBox(
                  height: AppDimens.h_282.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.featuredProduct.length,
                    itemBuilder: (context, index) {
                      var product = state.featuredProduct[index];
                      return ProductCart(product: product);
                    },
                    separatorBuilder: (_, _) => Gap(AppDimens.w_14.w),
                  ),
                );
              }
              if (state.isFeatureLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Center(child: Text(state.errorMessage ?? ""));
            },
          ),

          // New Products
          CustomSectionTitle(
            title: AppConstants.newProducts,
            onPressed: () {},
            color: AppColors.primaryColor,
          ),
          BlocBuilder<ProductCubit, ProductStates>(
            buildWhen: (previous, current) =>
                previous.newProduct != current.newProduct ||
                previous.isNewLoading != current.isNewLoading,
            builder: (context, state) {
              log("New state $state");
              if (state.newProduct.isNotEmpty) {
                return SizedBox(
                  height: AppDimens.h_282.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.newProduct.length,
                    itemBuilder: (context, index) {
                      var product = state.newProduct[index];
                      return ProductCart(product: product);
                    },
                    separatorBuilder: (_, _) => Gap(AppDimens.w_14.w),
                  ),
                );
              }
              if (state.isNewLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Center(child: Text(state.errorMessage ?? ""));
            },
          ),
        ],
      ),
    );
  }
}
