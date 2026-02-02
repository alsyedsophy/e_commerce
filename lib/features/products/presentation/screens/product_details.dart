import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:e_commerce/core/widgets/back_button_widget.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cubit/cart_state.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_buttom_sheet.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_cart_buttom.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_choose_attribute.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_choose_quantity.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_product_images.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_product_price.dart';
import 'package:e_commerce/features/products/presentation/widgets/favorite_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ValueNotifier<String> currentSizeNotifire;
  late ValueNotifier<String> currentColorNotifire;
  late ValueNotifier<int> quantityNotifire = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    currentSizeNotifire = ValueNotifier(widget.product.attributes!['size'][0]);
    currentColorNotifire = ValueNotifier(
      widget.product.attributes!['color'][0],
    );
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
                    CustomProductImages(widget: widget),
                    Text(
                      widget.product.name,
                      style: AppTextStyle.text24largeStyle,
                    ),
                    CustomProductPrice(widget: widget),
                    Gap(AppDimens.h_32.h),
                    ValueListenableBuilder(
                      valueListenable: currentSizeNotifire,
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () async {
                            final String? selectedSize =
                                await showModalBottomSheet<String?>(
                                  context: innerContext,
                                  builder: (context) => CustomButtomSheet(
                                    choise: List<String>.from(
                                      widget.product.attributes?['size'],
                                    ),
                                    defultChoose: currentSizeNotifire,
                                    title: "Size",
                                  ),
                                );
                            if (selectedSize != null) {
                              currentSizeNotifire.value = selectedSize;
                            }
                          },
                          child: CustomChooseAttribute(
                            title: "Size",
                            defultChoose: currentSizeNotifire.value,
                          ),
                        );
                      },
                    ),
                    Gap(AppDimens.h_32.h),
                    ValueListenableBuilder(
                      valueListenable: currentColorNotifire,
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () async {
                            final String? selectColor =
                                await showModalBottomSheet<String?>(
                                  context: innerContext,
                                  builder: (context) => CustomButtomSheet(
                                    choise: List<String>.from(
                                      widget.product.attributes?['color'] ?? [],
                                    ),
                                    defultChoose: currentColorNotifire,
                                    title: "Color",
                                  ),
                                );
                            if (selectColor != null) {
                              currentColorNotifire.value = selectColor;
                            }
                          },
                          child: CustomChooseAttribute(
                            title: 'Color',
                            defultChoose: currentColorNotifire.value,
                          ),
                        );
                      },
                    ),
                    Gap(AppDimens.h_32.h),
                    ValueListenableBuilder(
                      valueListenable: quantityNotifire,
                      builder: (context, quantityValue, child) {
                        return CustomChooseQuintity(
                          onQuantity: (quantity) {
                            quantityNotifire.value = quantity;
                          },
                        );
                      },
                    ),
                    Gap(AppDimens.h_24.h),
                    Text(
                      widget.product.description,
                      style: AppTextStyle.tetFielStyle,
                    ),
                    Gap(AppDimens.h_32.h),
                    BlocConsumer<CartCubit, CartState>(
                      listener: (context, state) {
                        if (state is CartError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                          );
                        }
                        if (state is CartLoaded) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('تم اضافة المنتج بتجاح')),
                          );
                        }
                      },
                      builder: (context, state) {
                        return CustomCartButtom(
                          product: widget.product,
                          state: state,
                          quantityNotifire: quantityNotifire,
                          sizeNotifire: currentSizeNotifire,
                          colorNotifire: currentColorNotifire,
                        );
                      },
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
