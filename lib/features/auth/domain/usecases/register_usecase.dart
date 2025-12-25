import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:e_commerce/features/auth/domain/repositores/auth_repository.dart';

class RegisterParams {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  RegisterParams({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });
}

class RegisterUsecase implements UseCase<User, RegisterParams> {
  final AuthRepository repository;

  RegisterUsecase(this.repository);
  @override
  Future<Either<Failures, User>> call(RegisterParams params) async {
    final validationError = _validateInput(params);
    if (validationError != null) {
      return Left(validationError);
    }
    return await repository.register(
      params.email,
      params.password,
      params.firstName,
      params.lastName,
    );
  }

  Failures? _validateInput(RegisterParams params) {
    if (params.email.isEmpty) {
      return InvalidInputFailure("Email is Required");
    }
    if (params.password.isEmpty) {
      return InvalidInputFailure("Password is Required");
    }
    if (params.firstName.isEmpty) {
      return InvalidInputFailure("The First Name is Required");
    }
    if (params.lastName.isEmpty) {
      return InvalidInputFailure("The Last Name is Required");
    }
    if (!_isValedEmail(params.email)) {
      return InvaledEmailFailure();
    }
    if (params.password.length < 8) {
      return WeekPasswordFailure();
    }
    if (params.firstName.length < 2) {
      return InvalidInputFailure("The First Name must be 2 at lest");
    }
    if (params.lastName.length < 2) {
      return InvalidInputFailure("The Last Name must be 2 at lest");
    }
    return null;
  }

  bool _isValedEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
