import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/routing/app_routs.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:e_commerce/core/widgets/back_button_widget.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.horPadding_23,
          ),
          child: Column(
            children: [
              Gap(AppDimens.h_50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonWidget(),
                  Spacer(),
                  Text(AppConstants.cart, style: AppTextStyle.text24largeStyle),
                  Spacer(),
                ],
              ),
              Gap(AppDimens.h_24.h),

              BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {
                  if (state is CartLoaded && state.errorMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage!)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CartError) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          state.message,
                          style: AppTextStyle.text24largeStyle,
                        ),
                      ),
                    );
                  }
                  if (state is CartLoaded) {
                    return state.itemsCount == 0
                        ? CustomEmptyCart()
                        : Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    context.read<CartCubit>().clearCart();
                                  },
                                  child: Text(
                                    AppConstants.removeAll,
                                    style: AppTextStyle.text24MediumStyle,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: AppDimens.h_550.h,
                                    child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        final cartItem = state.items[index];

                                        // استخدم CartItemWidget بدلاً من بناء الويدجت مباشرة هنا
                                        return CartItemWidget(
                                          cartItem: cartItem,
                                          key: ValueKey(
                                            cartItem.id +
                                                cartItem.size +
                                                cartItem.color,
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          Gap(AppDimens.h_16.h),
                                      itemCount: state.itemsCount,
                                    ),
                                  ),
                                  Gap(AppDimens.h_20.h),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      AppConstants.checkout,
                                      style: AppTextStyle.text24largeStyle
                                          .copyWith(
                                            color: AppColors.backGroundColor,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                  }
                  if (state is CartLoading) {
                    return Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// أنشئ ويدجت منفصل لكل عنصر عربة
class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.h_100.h,
      width: AppDimens.w_342.w,
      padding: EdgeInsets.all(AppDimens.h_6),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(AppDimens.r_12.r),
      ),
      child: Row(
        children: [
          CachedNetworkImage(imageUrl: cartItem.image, width: AppDimens.w_64.w),
          Gap(AppDimens.w_12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cartItem.name,
                  style: AppTextStyle.text24RegulerStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: RichText(
                          text: TextSpan(
                            text: AppConstants.size,
                            style: AppTextStyle.text24RegulerStyle.copyWith(
                              color: AppColors.textClothesColor,
                            ),
                            children: [
                              TextSpan(
                                text: cartItem.size,
                                style: AppTextStyle.text24MediumStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Gap(AppDimens.w_8.w),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: RichText(
                          text: TextSpan(
                            text: AppConstants.color,
                            style: AppTextStyle.text24RegulerStyle.copyWith(
                              color: AppColors.textClothesColor,
                            ),
                            children: [
                              TextSpan(
                                text: cartItem.color,
                                style: AppTextStyle.text24MediumStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\$ ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}",
                style: AppTextStyle.text24MediumStyle,
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      context.read<CartCubit>().updateQuantity(
                        cartItem,
                        newQuantity: cartItem.quantity + 1,
                      );
                    },
                  ),

                  Text("${cartItem.quantity}"),

                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: cartItem.quantity > 1
                        ? () {
                            context.read<CartCubit>().updateQuantity(
                              cartItem,
                              newQuantity: cartItem.quantity - 1,
                            );
                          }
                        : null,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomEmptyCart extends StatelessWidget {
  const CustomEmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppConstants.emptyCart, width: AppDimens.w_100.w),
            Gap(AppDimens.h_24.h),
            Text(
              AppConstants.yourCartIsEmpty,
              style: AppTextStyle.text24largeStyle,
            ),
            Gap(AppDimens.h_24.h),
            ElevatedButton(
              onPressed: () =>
                  context.pushReplacementNamed(AppRouts.categoriesScreen),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(AppDimens.w_185.w, AppDimens.h_49.h),
              ),
              child: Text(
                AppConstants.exploreCategories,
                style: AppTextStyle.text24RegulerStyle.copyWith(
                  color: AppColors.backGroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
