import 'package:dartz/dartz.dart';
import 'package:sportnews/src/shared/utils/failures.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

abstract class UseCaseNoParams<T> {
  Future<Either<Failure, T>> call();
}
