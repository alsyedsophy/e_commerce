import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/features/products/presentation/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomProductImages extends StatelessWidget {
  const CustomProductImages({super.key, required this.widget});

  final ProductDetails widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.h_220.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var image = widget.product.imageUrls[index];
          return CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: AppDimens.w_159.w,
            height: AppDimens.h_220.h,
          );
        },
        separatorBuilder: (context, index) {
          return Gap(AppDimens.w_14.w);
        },
        itemCount: widget.product.imageUrls.length,
      ),
    );
  }
}
