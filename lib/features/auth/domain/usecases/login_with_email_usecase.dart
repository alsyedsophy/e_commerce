import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:e_commerce/features/auth/domain/repositores/auth_repository.dart';

class LoginWithEmailParams {
  final String email;
  final String password;

  LoginWithEmailParams({required this.email, required this.password});
}

class LoginWithEmailUsecase implements UseCase<User, LoginWithEmailParams> {
  final AuthRepository repository;

  LoginWithEmailUsecase(this.repository);

  @override
  Future<Either<Failures, User>> call(LoginWithEmailParams params) async {
    if (params.email.isEmpty || params.password.isEmpty) {
      return Left(InvalidInputFailure("Email And Password are Required"));
    }
    if (params.password.length < 8) {
      return Left(WeekPasswordFailure());
    }
    if (!_isValidEmail(params.email)) {
      return Left(InvaledEmailFailure());
    }
    return await repository.loginWithEmail(params.email, params.password);
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
