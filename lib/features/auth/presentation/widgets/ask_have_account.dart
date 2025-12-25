import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/routing/app_routs.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AskHaveAccont extends StatelessWidget {
  const AskHaveAccont({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: AppConstants.dontHaveAnAccount,
          style: AppTextStyle.textSwapLoginButtomStyle,
          children: [
            TextSpan(
              text: AppConstants.createOne,
              style: AppTextStyle.textSwapLoginButtomStyle.copyWith(
                color: AppColors.textPrimaryColor,
                fontSize: 14.sp,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(AppRouts.registerScreen);
                },
            ),
          ],
        ),
      ),
    );
  }
}
