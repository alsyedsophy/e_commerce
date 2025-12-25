import 'package:e_commerce/app/dependency_injection.dart';
import 'package:e_commerce/core/routing/app_routs.dart';
import 'package:e_commerce/features/auth/presentation/screen/forget_password_screen.dart';
import 'package:e_commerce/features/auth/presentation/screen/login_screen.dart';
import 'package:e_commerce/features/auth/presentation/screen/register_screen.dart';
import 'package:e_commerce/features/auth/presentation/screen/send_email_screen.dart';
import 'package:e_commerce/features/products/domain/entities/cateroty.dart';
import 'package:e_commerce/features/products/presentation/bloc/category/category_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/product/product_cubit.dart';
import 'package:e_commerce/features/products/presentation/screens/buttom_nav_wrapper.dart';
import 'package:e_commerce/features/products/presentation/screens/categories_screen.dart';
import 'package:e_commerce/features/products/presentation/screens/home_screen.dart';
import 'package:e_commerce/features/products/presentation/screens/products_screen.dart';
import 'package:e_commerce/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterGenarationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRouts.loginScreen,
    routes: [
      GoRoute(
        path: AppRouts.loginScreen,
        name: AppRouts.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRouts.registerScreen,
        name: AppRouts.registerScreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: AppRouts.forgetPasswordScreen,
        name: AppRouts.forgetPasswordScreen,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: AppRouts.sendEmailScreen,
        name: AppRouts.sendEmailScreen,
        builder: (context, state) => SendEmailScreen(),
      ),
      GoRoute(
        path: AppRouts.categoriesScreen,
        name: AppRouts.categoriesScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<CategoryCubit>(),
          child: CategoriesScreen(),
        ),
      ),
      GoRoute(
        path: AppRouts.productsScreen,
        name: AppRouts.productsScreen,
        builder: (context, state) {
          Category category = state.extra as Category;
          return BlocProvider(
            create: (context) => sl<ProductCubit>(),
            child: ProductsScreen(category: category),
          );
        },
      ),
      ShellRoute(
        builder: (context, state, child) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<CategoryCubit>()),
            BlocProvider(create: (context) => sl<ProductCubit>()),
          ],
          child: ButtomNavWrapper(child: child),
        ),
        routes: [
          GoRoute(
            path: AppRouts.homeScreen,
            name: AppRouts.homeScreen,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: AppRouts.profileScreen,
            name: AppRouts.profileScreen,
            builder: (context, state) => ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
