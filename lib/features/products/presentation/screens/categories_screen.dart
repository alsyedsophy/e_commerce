import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/routing/app_routs.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:e_commerce/core/widgets/back_button_widget.dart';
import 'package:e_commerce/features/products/presentation/bloc/category/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
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
              Gap(AppDimens.h_50.h),
              BackButtonWidget(),
              Gap(AppDimens.h_16.h),
              Text(
                AppConstants.shopByCategories,
                style: AppTextStyle.largStyle,
              ),
              Gap(AppDimens.h_16.h),
              Expanded(
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryError) {
                      return Center(child: Text(state.message));
                    }
                    if (state is CategoryLoaded) {
                      return ListView.separated(
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          var category = state.categories[index];
                          return GestureDetector(
                            onTap: () => context.pushNamed(
                              AppRouts.productsScreen,
                              extra: category,
                            ),
                            child: Container(
                              height: AppDimens.h_50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.greyColor,
                                borderRadius: BorderRadius.circular(
                                  AppDimens.r_4.r,
                                ),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: AppDimens.r_20,
                                    backgroundColor: AppColors.greyColor,
                                    backgroundImage: NetworkImage(
                                      category.imageUrl,
                                    ),
                                  ),
                                  Gap(AppDimens.w_14.w),
                                  Text(
                                    category.name,
                                    style: AppTextStyle.text24MediumStyle,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, _) => Gap(AppDimens.h_10.h),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
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
