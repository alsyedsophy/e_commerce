import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.greyColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(AppConstants.google, width: AppDimens.h_24.h),

          Text(
            AppConstants.continueWithGoogle,
            style: AppTextStyle.textSocialButtomStyle,
          ),
        ],
      ),
    );
  }
}
