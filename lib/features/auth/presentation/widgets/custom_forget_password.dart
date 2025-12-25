import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/routing/app_routs.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomForgetPassword extends StatelessWidget {
  const CustomForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimens.h_12, left: AppDimens.h_8),
      child: RichText(
        text: TextSpan(
          text: AppConstants.forgotPassword,
          style: AppTextStyle.textSwapLoginButtomStyle,
          children: [
            TextSpan(
              text: AppConstants.reset,
              style: AppTextStyle.textSwapLoginButtomStyle.copyWith(
                color: AppColors.textPrimaryColor,
                fontSize: 14.sp,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(AppRouts.sendEmailScreen);
                },
            ),
          ],
        ),
      ),
    );
  }
}
