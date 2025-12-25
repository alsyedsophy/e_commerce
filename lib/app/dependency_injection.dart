import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/network/network_info.dart';
import 'package:e_commerce/core/network/network_info_impl.dart';
import 'package:e_commerce/features/auth/data/data%20source/auth_remote_data_source.dart';
import 'package:e_commerce/features/auth/data/repositores/auth_repository_impl.dart';
import 'package:e_commerce/features/auth/domain/repositores/auth_repository.dart';
import 'package:e_commerce/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/listen_to_auth_changes_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/logout_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/register_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/update_profile_usecase.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:e_commerce/features/products/data/data%20sourse/product_remote_data_source.dart';
import 'package:e_commerce/features/products/data/repositories/product_repo_impl.dart';
import 'package:e_commerce/features/products/domain/repository/product_repository.dart';
import 'package:e_commerce/features/products/domain/usecases/get_all_products_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/get_category_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/get_featured_product_usecse.dart';
import 'package:e_commerce/features/products/domain/usecases/get_new_products_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/get_product_by_id_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/get_products_by_category_usecase.dart';
import 'package:e_commerce/features/products/domain/usecases/search_product_usecase.dart';
import 'package:e_commerce/features/products/presentation/bloc/category/category_cubit.dart';
import 'package:e_commerce/features/products/presentation/bloc/product/product_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //? Core/Netwok
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectionChecker: sl()),
  );
  sl.registerLazySingleton(() => InternetConnectionChecker);

  //? Cubit
  // Auth
  sl.registerFactory(
    () => AuthCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()),
  );

  // Products
  sl.registerFactory(() => ProductCubit(sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => CategoryCubit(sl()));

  //? Usecases
  // Auth
  sl.registerLazySingleton(() => LoginWithEmailUsecase(sl()));
  sl.registerLazySingleton(() => LoginWithGoogleUsecase(sl()));
  sl.registerLazySingleton(() => RegisterUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProfileUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));
  sl.registerLazySingleton(() => SendPasswordResetEmailUsecase(sl()));
  sl.registerLazySingleton(() => GetCurrentUserUsecase(sl()));
  sl.registerLazySingleton(() => ListenToAuthChangesUsecase(sl()));

  // Products
  sl.registerLazySingleton(() => GetAllProductsUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetFeaturedProductUsecse(repository: sl()));
  sl.registerLazySingleton(() => GetNewProductsUsecase(repository: sl()));
  sl.registerLazySingleton(
    () => GetProductsByCategoryUsecase(repository: sl()),
  );
  sl.registerLazySingleton(() => GetProductByIdUsecase(repository: sl()));
  sl.registerLazySingleton(() => SearchProductUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetCategoryUsecase(repository: sl()));

  //? Reositories
  // Auth
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );
  // Products
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepoImpl(remoteDataSource: sl()),
  );

  //? Data Source
  // Auth
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSoureImpl(
      firebaseAuth: sl(),
      firestore: sl(),
      googleSignIn: sl(),
    ),
  );
  // Products
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(firestore: sl()),
  );

  //? External Firebase
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => GoogleSignIn.instance);
}
