import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:e_commerce/features/products/presentation/widgets/favorite_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("message");
      },
      child: SizedBox(
        height: AppDimens.h_280.h,
        width: AppDimens.w_159.w,
        child: Stack(
          children: [
            Card(
              color: AppColors.greyColor,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: product.thumbnailUrl ?? "",
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: AppDimens.w_159.w,
                    height: AppDimens.h_220.h,
                  ),
                  Gap(AppDimens.h_4.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Column(
                      children: [
                        Text(
                          product.name,
                          style: AppTextStyle.productNameStyle,
                          maxLines: 1,
                        ),
                        Gap(AppDimens.h_4.h),
                        Text(product.price.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: AppDimens.h_10.h,
              right: AppDimens.w_10.w,
              child: FavoriteWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
