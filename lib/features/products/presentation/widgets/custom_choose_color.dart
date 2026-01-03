import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomChooseColor extends StatelessWidget {
  const CustomChooseColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.h_56.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppDimens.h_16.h),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(AppDimens.r_28.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Size", style: AppTextStyle.text24MediumStyle),
          Row(
            children: [
              Text("S", style: AppTextStyle.text24MediumStyle),
              Gap(AppDimens.w_14.w),
              Icon(Icons.keyboard_arrow_down, size: 30.sp),
            ],
          ),
        ],
      ),
    );
  }
}
