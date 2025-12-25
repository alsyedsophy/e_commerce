import 'package:e_commerce/features/products/presentation/bloc/product/product_state.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultView extends StatelessWidget {
  final ProductStates state;

  const SearchResultView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    if (state.isSearchLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.searchProduct.isEmpty) {
      return const Center(child: Text("لا توجد نتائج"));
    }

    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 16.h),
      itemCount: state.searchProduct.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return ProductCart(product: state.searchProduct[index]);
      },
    );
  }
}
