import 'package:e_commerce/core/themes/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAttribureTitle extends StatelessWidget {
  const CustomAttribureTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Text(title, style: AppTextStyle.text24largeStyle),
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(CupertinoIcons.multiply, size: 25.sp),
        ),
      ],
    );
  }
}
