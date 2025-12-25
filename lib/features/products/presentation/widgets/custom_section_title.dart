import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomSectionTitle extends StatelessWidget {
  const CustomSectionTitle({
    super.key,
    required this.title,
    this.onPressed,
    this.color,
  });
  final String title;
  final void Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.text24MediumStyle.copyWith(color: color),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            AppConstants.seeAll,
            style: AppTextStyle.text24RegulerStyle,
          ),
        ),
      ],
    );
  }
}
