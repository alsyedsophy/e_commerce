import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(AppConstants.back, width: AppDimens.w_40.w),
      onTap: () => context.pop(),
    );
  }
}
