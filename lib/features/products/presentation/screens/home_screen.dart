import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/features/products/presentation/bloc/category/category_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/product/product_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/product/product_state.dart';
import 'package:e_commerce/features/products/presentation/widgets/header_widget.dart';
import 'package:e_commerce/features/products/presentation/widgets/home_result_view.dart';
import 'package:e_commerce/features/products/presentation/widgets/search_result_view.dart';
import 'package:e_commerce/features/products/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<ProductCubit>();
    cubit.getFeaturedProduct();
    cubit.getNewProduct();
    context.read<CategoryCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.horPadding_23,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              HeaderWidget(),
              // Search
              SearchWidget(),
              Gap(AppDimens.h_24.h),
              // Category
              Expanded(
                child: BlocBuilder<ProductCubit, ProductStates>(
                  builder: (context, state) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<ProductCubit>().refrechHome();
                        context.read<CategoryCubit>().getCategories();
                      },
                      child: state.isSearch
                          ? SearchResultView(state)
                          : HomeResultView(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
