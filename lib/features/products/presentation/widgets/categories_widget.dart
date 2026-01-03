import 'package:e_commerce/core/routing/app_routs.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:e_commerce/features/products/presentation/bloc/category/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, required this.state});

  final CategoryLoaded state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.h_80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: state.categories.length,
        itemBuilder: (context, index) {
          var category = state.categories[index];
          return GestureDetector(
            onTap: () =>
                context.pushNamed(AppRouts.productsScreen, extra: category),
            child: Column(
              children: [
                Container(
                  height: AppDimens.h_56.h,
                  width: AppDimens.w_56.w,
                  decoration: BoxDecoration(
                    color: AppColors.backGroundColor,
                    borderRadius: BorderRadius.circular(AppDimens.r_23.r),
                  ),
                  child: CircleAvatar(
                    radius: AppDimens.r_23.r,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(category.imageUrl),
                  ),
                ),
                Gap(AppDimens.h_6),
                Text(category.name, style: AppTextStyle.categoryNameStyle),
              ],
            ),
          );
        },
        separatorBuilder: (_, _) => Gap(AppDimens.w_14.w),
      ),
    );
  }
}
