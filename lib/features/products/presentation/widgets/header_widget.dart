import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(AppDimens.h_50.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.greyColor,
              backgroundImage: NetworkImage(
                'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              ),
            ),
            Image.asset(AppConstants.cart, width: AppDimens.w_40.w),
          ],
        ),
        Gap(AppDimens.h_24.h),
      ],
    );
  }
}
