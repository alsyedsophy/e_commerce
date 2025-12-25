import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:e_commerce/features/auth/domain/repositores/auth_repository.dart';

class UpdateProfileParams {
  final String? firstName;
  final String? lastName;

  UpdateProfileParams({this.firstName, this.lastName});
  bool get hasChanges => (firstName != null) || (lastName != null);
}

class UpdateProfileUsecase implements UseCase<User, UpdateProfileParams> {
  final AuthRepository repository;

  UpdateProfileUsecase(this.repository);

  @override
  Future<Either<Failures, User>> call(UpdateProfileParams params) async {
    if (!params.hasChanges) {
      return Left(InvalidInputFailure("Not Changes To Save It"));
    }
    if (params.firstName != null && params.firstName!.isNotEmpty) {
      if (params.firstName!.length < 2) {
        return Left(InvalidInputFailure("The First Name must be 2 at lest"));
      }
    }
    if (params.lastName != null && params.lastName!.isNotEmpty) {
      if (params.lastName!.length < 2) {
        return Left(InvalidInputFailure("The Last Name must be 2 at lest"));
      }
    }

    return await repository.updateProfile(
      params.firstName?.trim(),
      params.lastName?.trim(),
    );
  }
}
