import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/features/auth/data/data%20source/auth_remote_data_source.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:e_commerce/features/auth/domain/repositores/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Stream<User?> get authStateChange => authRemoteDataSource.authStateChange;

  @override
  Future<Either<Failures, User>> loginWithEmail(
    String email,
    String password,
  ) async {
    try {
      final user = await authRemoteDataSource.signinWithEmail(email, password);
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, User>> loginWithGoogle() async {
    try {
      final user = await authRemoteDataSource.signinWithGoolge();
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, User>> register(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    try {
      final user = await authRemoteDataSource.register(
        email,
        password,
        firstName,
        lastName,
      );
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> sendPasswordResetEmail(String email) async {
    try {
      await authRemoteDataSource.sentPasswordResetEmail(email);
      return Right(null);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> logout() async {
    try {
      await authRemoteDataSource.logout();
      return Right(null);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, User?>> getCurrentUser() async {
    try {
      final user = await authRemoteDataSource.getCurrentUser();
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, User>> updateProfile(
    String? firstName,
    String? lastName,
  ) async {
    try {
      final user = await authRemoteDataSource.updateProfile(
        firstName,
        lastName,
      );
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }
}
