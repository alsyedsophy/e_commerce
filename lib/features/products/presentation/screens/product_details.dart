import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:e_commerce/core/widgets/back_button_widget.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_attribute_title.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_choose_attribute.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_choose_size.dart';
import 'package:e_commerce/features/products/presentation/widgets/favorite_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late String currentSize;

  @override
  void initState() {
    super.initState();
    currentSize = 'S';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (innerContext) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.horPadding_23,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(AppDimens.h_50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [BackButtonWidget(), FavoriteWidget()],
                    ),
                    Gap(AppDimens.h_16.h),
                    SizedBox(
                      height: AppDimens.h_220.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var image = widget.product.imageUrls[index];
                          return CachedNetworkImage(
                            imageUrl: image,
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            // width: AppDimens.w_159.w,
                            // height: AppDimens.h_220.h,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Gap(AppDimens.w_14.w);
                        },
                        itemCount: widget.product.imageUrls.length,
                      ),
                    ),
                    Text(
                      widget.product.name,
                      style: AppTextStyle.text24largeStyle,
                    ),
                    Row(
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
                    ),
                    Gap(AppDimens.h_32.h),
                    GestureDetector(
                      onTap: () async {
                        final String? selectedSize =
                            await showModalBottomSheet<String?>(
                              context: innerContext,
                              builder: (context) => SizeButtomSheet(
                                sizes: List<String>.from(
                                  widget.product.attributes?['size'],
                                ),
                                defultSize: currentSize,
                              ),
                            );
                        log(selectedSize.toString());
                        if (selectedSize != null) {
                          setState(() {
                            currentSize = selectedSize;
                          });
                        }
                      },
                      child: CustomChooseAttribute(
                        title: "Size",
                        defultChoose: currentSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SizeButtomSheet extends StatefulWidget {
  SizeButtomSheet({super.key, required this.sizes, required this.defultSize});
  final List<String> sizes;
  String defultSize;

  @override
  State<SizeButtomSheet> createState() => _SizeButtomSheetState();
}

class _SizeButtomSheetState extends State<SizeButtomSheet> {
  late ValueNotifier<String> selectedSizeNotifire;
  @override
  void initState() {
    super.initState();
    selectedSizeNotifire = ValueNotifier<String>(widget.defultSize);
  }

  @override
  void dispose() {
    super.dispose();
    selectedSizeNotifire.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedSizeNotifire,
      builder: (context, selectedSize, child) {
        return Container(
          height: AppDimens.h_397.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.redColor,
            borderRadius: BorderRadius.circular(AppDimens.r_20.r),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.horPadding_23,
              vertical: AppDimens.verticale_17,
            ),
            child: Column(
              children: [
                CustomAttribureTitle(title: "Size"),
                Gap(AppDimens.h_24.h),
                Expanded(
                  child: ListView(
                    children: [
                      ...widget.sizes.map(
                        (size) => CustomChooseSize(
                          size: size,
                          isSelected: selectedSize == size,
                          onSelect: (selected) {
                            selectedSizeNotifire.value = selected;
                            Navigator.of(context).pop(selected);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
