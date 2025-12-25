import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/routing/app_routs.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SendEmailScreen extends StatefulWidget {
  const SendEmailScreen({super.key});

  @override
  State<SendEmailScreen> createState() => _SendEmailScreenState();
}

class _SendEmailScreenState extends State<SendEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.horPadding_23,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset("assets/icons/image.png", width: AppDimens.w_100.w),
              Gap(AppDimens.h_24.h),
              Text(
                AppConstants.sendEmail,
                textAlign: TextAlign.center,
                style: AppTextStyle.text24MediumStyle,
              ),
              Gap(AppDimens.h_24.h),
              ElevatedButton(
                onPressed: () {
                  context.goNamed(AppRouts.loginScreen);
                },

                child: Text(
                  AppConstants.returnToLogin,
                  style: AppTextStyle.textMainButtomStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
