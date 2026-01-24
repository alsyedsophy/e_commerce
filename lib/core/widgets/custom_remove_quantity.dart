import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRemoveQuantity extends StatelessWidget {
  const CustomRemoveQuantity({
    super.key,
    required this.quantityNotifire,
    required this.onQuantity,
    required this.size,
  });

  final ValueNotifier<int> quantityNotifire;
  final Function(int) onQuantity;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (quantityNotifire.value > 1) {
          quantityNotifire.value--;
          onQuantity(quantityNotifire.value);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.remove,
          size: size.sp,
          color: AppColors.backGroundColor,
        ),
      ),
    );
  }
}
