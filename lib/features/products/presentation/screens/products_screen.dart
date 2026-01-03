import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:e_commerce/core/widgets/back_button_widget.dart';
import 'package:e_commerce/features/products/domain/entities/cateroty.dart';
import 'package:e_commerce/features/products/presentation/bloc/product/product_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/product/product_state.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.category});
  final Category category;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProductByCategory(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.horPadding_23,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(AppDimens.h_50.h),
              BackButtonWidget(),
              Gap(AppDimens.h_16.h),
              Text(
                widget.category.name,
                style: AppTextStyle.largStyle.copyWith(fontSize: 22),
              ),
              Gap(AppDimens.h_23.h),
              Expanded(
                child: BlocBuilder<ProductCubit, ProductStates>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state.products.isEmpty) {
                      return Center(
                        child: Text(
                          "لا توجد منتجات",
                          style: AppTextStyle.text24MediumStyle,
                        ),
                      );
                    }
                    if (state.products.isNotEmpty) {
                      return GridView.builder(
                        itemCount: state.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                        ),
                        itemBuilder: (context, index) {
                          var product = state.products[index];
                          return ProductCart(product: product);
                        },
                      );
                    }
                    return Center(
                      child: Text(state.errorMessage ?? "حصل مشكلة ما"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
