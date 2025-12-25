import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/features/auth/presentation/validators/auth_validator_mixin.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginFormField extends StatelessWidget with AuthValidatorMixin {
  const LoginFormField({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
          hinitText: AppConstants.emailAddress,
          validator: validateEmail,
        ),
        Gap(AppDimens.h_16.h),
        CustomTextFormField(
          controller: passwordController,
          hinitText: AppConstants.emailAddress,
          validator: validatePassword,
        ),
      ],
    );
  }
}
