import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:e_commerce/features/auth/domain/repositores/auth_repository.dart';

class LoginWithGoogleUsecase implements UseCase<User, NoParams> {
  final AuthRepository repository;

  LoginWithGoogleUsecase(this.repository);
  @override
  Future<Either<Failures, User>> call(NoParams params) async {
    return await repository.loginWithGoogle();
  }
}
