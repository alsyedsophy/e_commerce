import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:e_commerce/features/products/presentation/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomProductPrice extends StatelessWidget {
  const CustomProductPrice({super.key, required this.widget});

  final ProductDetails widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${widget.product.finalPrice} .ج م",
          style: AppTextStyle.text24MediumStyle.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        Gap(AppDimens.w_14.w),
        widget.product.hasDiscount
            ? Text(
                "${widget.product.price} .ج م",
                style: AppTextStyle.productNameStyle.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
