import 'dart:async';

import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:e_commerce/features/auth/domain/repositores/auth_repository.dart';
import 'package:e_commerce/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/login_with_email_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/login_with_google_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/logout_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/register_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:e_commerce/features/auth/domain/usecases/update_profile_usecase.dart';
import 'package:e_commerce/features/auth/presentation/bloc/auth_state.dart';
import 'package:e_commerce/features/auth/presentation/validators/auth_validator_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> with AuthValidatorMixin {
  final LoginWithEmailUsecase loginWithEmailUsecase;
  final LoginWithGoogleUsecase loginWithGoogleUsecase;
  final RegisterUsecase registerUsecase;
  final LogoutUsecase logoutUsecase;
  final GetCurrentUserUsecase getCurrentUserUsecase;
  final UpdateProfileUsecase updateProfileUsecase;
  final SendPasswordResetEmailUsecase sendPasswordResetEmailUsecase;
  final AuthRepository authRepository;

  StreamSubscription<User?>? _authSubscription;
  AuthCubit(
    this.loginWithEmailUsecase,
    this.loginWithGoogleUsecase,
    this.registerUsecase,
    this.logoutUsecase,
    this.getCurrentUserUsecase,
    this.updateProfileUsecase,
    this.sendPasswordResetEmailUsecase,
    this.authRepository,
  ) : super(AuthInit()) {
    _startListeningToAuthChanges();
  }

  // Login With Email And Password
  Future<void> loginWithEmail(String email, String password) async {
    // final validationError = validateEmail(email);
    // if (validationError != null) {
    //   emit(validationError);
    // }
    emit(AuthLoading());
    final result = await loginWithEmailUsecase.call(
      LoginWithEmailParams(email: email, password: password),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  // Login With Google
  Future<void> loginWithGoogle() async {
    emit(AuthLoading());
    final result = await loginWithGoogleUsecase.call(NoParams());

    result.fold(
      (failure) => emit(AuthError(failure.message)),

      (user) => emit(AuthAuthenticated(user)),
    );
  }

  // Create a New Account

  Future<void> register(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    // final validationError = validateRegistration(
    //   email: email,
    //   password: password,
    //   firstName: firstName,
    //   lastName: lastName,
    // );
    // if (validationError != null) {
    //   emit(validationError);
    // }
    emit(AuthLoading());

    final result = await registerUsecase.call(
      RegisterParams(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      ),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthAuthenticated(user)),
    );
  }

  // Log Out
  Future<void> logout() async {
    emit(AuthLoading());
    final result = await logoutUsecase.call(NoParams());

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthUnAuthenticated()),
    );
  }

  // Update Profile
  Future<void> updateProfile(String? firstName, String? lastName) async {
    // if (firstName != null) {
    //   final firstNameError = validateName(firstName, "الاسم الاول");
    //   if (firstNameError != null) {
    //     emit(firstNameError);
    //   }
    // }
    // if (lastName != null) {
    //   final lastNameError = validateName(lastName, "الاسم الاخير");
    //   if (lastNameError != null) {
    //     emit(lastNameError);
    //   }
    // }
    emit(AuthLoading());
    final result = await updateProfileUsecase.call(
      UpdateProfileParams(firstName: firstName, lastName: lastName),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthProfileUpdate(user)),
    );
  }

  // Get Current User
  Future<void> currentUser() async {
    emit(AuthLoading());
    final result = await getCurrentUserUsecase.call(NoParams());
    result.fold((failure) => AuthError(failure.message), (user) {
      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthError("فشل الوصول الى المستخدم الخالى"));
      }
    });
  }

  // Send Password To Reset Email
  Future<void> sendEmailResetPassword(String email) async {
    // final validationError = validateEmail(email);
    // if (validationError != null) {
    //   emit(validationError);
    // }
    emit(AuthLoading());
    final result = await sendPasswordResetEmailUsecase.call(
      SendPasswordResetParams(email: email),
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(
        AuthSendPasswordResetEmail(
          "تم ارسال ايميل للتحقق افحص البريد الخاص بك",
        ),
      ),
    );
  }

  // دالة الاستماع الى حالة المستخدم
  void _startListeningToAuthChanges() {
    _authSubscription = authRepository.authStateChange.listen(
      _onAuthStateChanged,
      onError: (error) {
        emit(AuthError("حدث خطأ فى تحديث حالة المصادقه"));
      },
    );
  }

  // التحديث التلقائي للحالة عند تغيير المستخدم
  void _onAuthStateChanged(User? user) {
    if (user == null) {
      emit(AuthUnAuthenticated());
    } else {
      emit(AuthAuthenticated(user));
    }
  }

  // تقوم بقتل ال stream عند الخروج من مساحة ال cubit
  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
