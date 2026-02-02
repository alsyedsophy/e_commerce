import 'package:e_commerce/app/dependency_injection.dart' as di;
import 'package:e_commerce/app/my_app.dart';
import 'package:e_commerce/core/constants/app_constants.dart';
import 'package:e_commerce/core/hive/hive_init.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:e_commerce/features/cart/data/model/local%20model/cart_item_model.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await HiveInit.init();
  di.sl.registerLazySingleton<Box<HiveCartItemModel>>(
    () => Hive.box<HiveCartItemModel>(AppConstants.cartBoxName),
  );
  await di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthCubit>()),
        BlocProvider(create: (context) => di.sl<CartCubit>()),
      ],
      child: MyApp(),
    ),
  );
}
