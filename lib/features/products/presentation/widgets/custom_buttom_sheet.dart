import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_dimens.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_attribute_title.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_choose_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class CustomButtomSheet extends StatefulWidget {
  CustomButtomSheet({
    super.key,
    required this.choise,
    required this.defultChoose,
    required this.title,
  });
  final List<String> choise;
  ValueNotifier<String> defultChoose;
  final String title;

  @override
  State<CustomButtomSheet> createState() => _CustomButtomSheetState();
}

class _CustomButtomSheetState extends State<CustomButtomSheet> {
  late ValueNotifier<String> selectedChooseNotifire;
  @override
  void initState() {
    super.initState();
    selectedChooseNotifire = ValueNotifier<String>(widget.defultChoose.value);
  }

  @override
  void dispose() {
    super.dispose();
    selectedChooseNotifire.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedChooseNotifire,
      builder: (context, selectedChoose, child) {
        return Container(
          height: AppDimens.h_397.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.backGroundColor,
            borderRadius: BorderRadius.circular(AppDimens.r_20.r),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.horPadding_23,
              vertical: AppDimens.verticale_17,
            ),
            child: Column(
              children: [
                CustomAttribureTitle(title: widget.title),
                Gap(AppDimens.h_24.h),
                Expanded(
                  child: ListView(
                    children: [
                      ...widget.choise.map(
                        (size) => CustomChooseSize(
                          size: size,
                          isSelected: selectedChoose == size,
                          onSelect: (selected) {
                            selectedChooseNotifire.value = selected;
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
