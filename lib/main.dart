import 'package:e_commerce/app/dependency_injection.dart' as di;
import 'package:e_commerce/app/my_app.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(BlocProvider(create: (context) => di.sl<AuthCubit>(), child: MyApp()));
}
