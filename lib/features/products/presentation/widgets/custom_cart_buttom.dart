import 'dart:developer';

import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCartButtom extends StatelessWidget {
  const CustomCartButtom({
    super.key,
    required this.product,
    required this.state,
    required this.quantityNotifire,
    required this.sizeNotifire,
    required this.colorNotifire,
  });

  final Product product;
  final ValueNotifier<int> quantityNotifire;
  final ValueNotifier<String> sizeNotifire;
  final ValueNotifier<String> colorNotifire;
  final CartState state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: state is CartLoading
          ? null
          : () {
              CartItem cartItem = CartItem(
                id: product.id,
                name: product.name,
                image: product.thumbnailUrl ?? '',
                price: product.finalPrice,
                quantity: quantityNotifire.value,
                size: sizeNotifire.value,
                color: colorNotifire.value,
                stock: product.stock,
              );
              // log(cartItem.size);
              // log(cartItem.color);
              // log(cartItem.quantity.toString());
              context.read<CartCubit>().addItem(cartItem);
            },
      child: Container(
        height: AppDimens.h_56.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: AppDimens.h_16.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(AppDimens.r_28.r),
        ),
        child: state is CartLoading
            ? Center(child: CircularProgressIndicator())
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ ${product.finalPrice}",
                    style: AppTextStyle.text24MediumStyle.copyWith(
                      color: AppColors.backGroundColor,
                    ),
                  ),
                  Text(
                    "Add To Cart",
                    style: AppTextStyle.text24MediumStyle.copyWith(
                      color: AppColors.backGroundColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
