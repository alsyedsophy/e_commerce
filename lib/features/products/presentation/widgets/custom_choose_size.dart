import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomChooseSize extends StatelessWidget {
  const CustomChooseSize({
    super.key,
    required this.size,
    required this.isSelected,
    required this.onSelect,
  });
  final String size;
  final bool isSelected;
  final Function(String) onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isSelected ? null : onSelect(size),
      child: Column(
        children: [
          Container(
            height: AppDimens.h_56.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: AppDimens.h_16.h),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryColor : AppColors.greyColor,
              borderRadius: BorderRadius.circular(AppDimens.r_28.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  size,
                  style: isSelected
                      ? AppTextStyle.text24MediumStyle.copyWith(
                          color: AppColors.backGroundColor,
                        )
                      : AppTextStyle.text24MediumStyle,
                ),
                Gap(AppDimens.w_14.w),
                isSelected
                    ? Icon(
                        Icons.check,
                        size: 30.sp,
                        color: isSelected
                            ? AppColors.backGroundColor
                            : AppColors.textPrimaryColor,
                      )
                    : SizedBox(),
              ],
            ),
          ),
          Gap(AppDimens.h_16.h),
        ],
      ),
    );
  }
}
