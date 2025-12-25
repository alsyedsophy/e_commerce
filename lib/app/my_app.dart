import 'package:e_commerce/core/routing/rout_config.dart';
import 'package:e_commerce/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const MyApp instance = MyApp._internal();
  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          title: "E Commerce",
          routerConfig: RouterGenarationConfig.goRouter,
        );
      },
    );
  }
}
