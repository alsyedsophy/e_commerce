import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/auth/domain/repositores/auth_repository.dart';

class SendPasswordResetParams {
  final String email;

  SendPasswordResetParams({required this.email});
}

class SendPasswordResetEmailUsecase
    implements UseCase<void, SendPasswordResetParams> {
  final AuthRepository repository;

  SendPasswordResetEmailUsecase(this.repository);
  @override
  Future<Either<Failures, void>> call(SendPasswordResetParams params) async {
    if (params.email.isEmpty) {
      return Left(InvalidInputFailure("Email is Required"));
    }
    if (!_isValedEmail(params.email)) {
      return Left(InvaledEmailFailure());
    }

    return await repository.sendPasswordResetEmail(params.email);
  }

  bool _isValedEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
