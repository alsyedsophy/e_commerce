import 'package:e_commerce/core/usecases/use_case.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:e_commerce/features/auth/domain/repositores/auth_repository.dart';

class ListenToAuthChangesUsecase implements StreamUseCase<User?, NoParams> {
  final AuthRepository repository;

  ListenToAuthChangesUsecase(this.repository);
  @override
  Stream<User?> call(NoParams params) {
    return repository.authStateChange;
  }
}
