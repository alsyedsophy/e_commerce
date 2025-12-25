import 'dart:async';

import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/features/products/presentation/bloc/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 300), () {
      context.read<ProductCubit>().searchProduct(value.trim());
    });
  }

  void _clearSearch() {
    _controller.clear();
    context.read<ProductCubit>().searchProduct('');
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: _onSearchChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                onPressed: () => _clearSearch(),
                icon: Icon(Icons.close),
              )
            : null,
        hintText: "Search",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.r_28.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.r_28.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.r_28.r),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
