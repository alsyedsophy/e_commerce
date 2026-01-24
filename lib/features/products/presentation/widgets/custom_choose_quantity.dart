import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:e_commerce/core/widgets/custom_add_quantity.dart';
import 'package:e_commerce/core/widgets/custom_remove_quantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomChooseQuintity extends StatefulWidget {
  const CustomChooseQuintity({super.key, required this.onQuantity});

  final Function(int) onQuantity;

  @override
  State<CustomChooseQuintity> createState() => _CustomChooseQuintityState();
}

class _CustomChooseQuintityState extends State<CustomChooseQuintity> {
  ValueNotifier<int> quantityNotifire = ValueNotifier(1);

  @override
  void dispose() {
    quantityNotifire.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.h_56.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: AppDimens.h_16.h),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(AppDimens.r_28.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Quantity", style: AppTextStyle.text24MediumStyle),
          ValueListenableBuilder(
            valueListenable: quantityNotifire,
            builder: (context, quantity, child) {
              return Row(
                children: [
                  CustomAddQuantity(
                    quantityNotifire: quantityNotifire,
                    onQuantity: widget.onQuantity,
                    size: 30,
                  ),
                  Gap(AppDimens.w_23.w),
                  SizedBox(
                    width: AppDimens.w_40.w,
                    child: Text(
                      "$quantity",
                      style: AppTextStyle.text24largeStyle,
                    ),
                  ),
                  CustomRemoveQuantity(
                    quantityNotifire: quantityNotifire,
                    onQuantity: widget.onQuantity,
                    size: 30,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
