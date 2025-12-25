import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failures, User>> loginWithEmail(String email, String password);
  Future<Either<Failures, User>> loginWithGoogle();
  Future<Either<Failures, User>> register(
    String email,
    String password,
    String firstname,
    String lastName,
  );
  Future<Either<Failures, void>> logout();
  Future<Either<Failures, void>> sendPasswordResetEmail(String email);
  Stream<User?> get authStateChange;
  Future<Either<Failures, User?>> getCurrentUser();
  Future<Either<Failures, User>> updateProfile(
    String? firstName,
    String? lastName,
  );
}
