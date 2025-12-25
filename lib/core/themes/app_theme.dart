import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backGroundColor,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.greyColor,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.r_12.r),
          // borderSide: BorderSide(color: )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.r_12.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.r_12.r),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.r_12.r),
          borderSide: BorderSide(color: AppColors.redColor),
        ),
        hintStyle: AppTextStyle.tetFielStyle,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.backGroundColor,
          minimumSize: Size(double.infinity, AppDimens.h_49.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.r_28.r),
          ),
          textStyle: AppTextStyle.textMainButtomStyle,
        ),
      ),
    );
  }
}
