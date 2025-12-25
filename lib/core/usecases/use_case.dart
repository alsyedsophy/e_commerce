// ignore_for_file: avoid_types_as_parameter_names

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failures, Type>> call(Params params);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}

class NoParams {
  const NoParams();
}
