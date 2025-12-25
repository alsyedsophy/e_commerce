import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/auth/domain/repositores/auth_repository.dart';

class LogoutUsecase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  LogoutUsecase(this.repository);
  @override
  Future<Either<Failures, void>> call(NoParams params) async {
    return await repository.logout();
  }
}
