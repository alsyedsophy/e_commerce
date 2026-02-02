import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(AppDimens.h_50.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.greyColor,
              backgroundImage: NetworkImage(
                'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              ),
            ),
            BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous, current) =>
                  previous.runtimeType != current.runtimeType,
              builder: (context, state) {
                final count = state.when(
                  initial: () => 0,
                  loading: () => 0,
                  loaded: (items, _, _) => items.length,
                  error: (_, items, _) => items?.length ?? 0,
                  syncing: () => 0,
                  synced: (items, _) => 0,
                  empty: () => 0,
                );
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: Image.asset(
                        AppConstants.cartIcon,
                        width: AppDimens.w_40.w,
                      ),
                    ),
                    if (count > 0)
                      Positioned(
                        top: -6,
                        right: -6,
                        child: Container(
                          height: AppDimens.h_32.h,
                          width: AppDimens.h_32.h,

                          padding: EdgeInsets.all(AppDimens.h_8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.redColor,
                            shape: BoxShape.circle,
                          ),
                          // constraints: BoxConstraints(
                          //   minHeight: 18,
                          //   minWidth: 18,
                          // ),
                          child: Text(
                            "$count",
                            style: AppTextStyle.text24RegulerStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
        Gap(AppDimens.h_24.h),
      ],
    );
  }
}
