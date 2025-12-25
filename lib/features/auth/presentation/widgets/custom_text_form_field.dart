import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hinitText,
    required this.validator,
  });
  final TextEditingController controller;
  final String hinitText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      decoration: InputDecoration(hintText: hinitText),
      validator: (value) {
        return validator!(value);
      },
    );
  }
}
