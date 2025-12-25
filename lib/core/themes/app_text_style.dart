import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:flutter/widgets.dart';

class AppTextStyle {
  static const TextStyle largStyle = TextStyle(
    fontFamily: AppConstants.textFamily,
    fontWeight: FontWeight.bold,
    fontSize: 32,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle tetFielStyle = TextStyle(
    fontFamily: AppConstants.textFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.textFieldColor,
  );
  static const TextStyle textMainButtomStyle = TextStyle(
    fontFamily: AppConstants.textFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.backGroundColor,
  );
  static const TextStyle textSocialButtomStyle = TextStyle(
    fontFamily: AppConstants.textFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.textPrimaryColor,
  );
  static const TextStyle textSwapLoginButtomStyle = TextStyle(
    fontFamily: AppConstants.textFamily,
    fontWeight: FontWeight.w300,
    fontSize: 12,
    color: AppColors.textPrimaryColor,
  );
  static const TextStyle text24MediumStyle = TextStyle(
    fontFamily: AppConstants.textFamily,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppColors.textPrimaryColor,
  );
  static const TextStyle textNotificationStyle = TextStyle(
    fontFamily: AppConstants.textFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,

    color: AppColors.textPrimaryColor,
  );
  static const TextStyle text24RegulerStyle = TextStyle(
    fontFamily: AppConstants.textFamily,
    fontWeight: FontWeight.w300,
    fontSize: 16,
    color: AppColors.textPrimaryColor,
  );
  static const TextStyle categoryNameStyle = TextStyle(
    fontFamily: AppConstants.textFamily,
    fontWeight: FontWeight.w300,
    fontSize: 14,

    color: AppColors.textPrimaryColor,
  );
  static const TextStyle productNameStyle = TextStyle(
    fontFamily: AppConstants.textFamily,
    fontWeight: FontWeight.w200,
    fontSize: 16,
    letterSpacing: 1.5,

    color: AppColors.textPrimaryColor,
  );
}
