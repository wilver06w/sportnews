import 'package:dartz/dartz.dart';
import 'package:sportnews/src/features/home/domain/entities/news_model.dart';
import 'package:sportnews/src/features/home/domain/repositories/abstract_home_repository.dart';
import 'package:sportnews/src/shared/utils/failures.dart';
import 'package:sportnews/src/shared/utils/usecases/usecase.dart';

class ListNewsSportUseCase extends UseCaseNoParams<List<NewsModels>> {
  final AbstractHomeRepository repository;

  ListNewsSportUseCase({required this.repository});

  @override
  Future<Either<Failure, List<NewsModels>>> call() async {
    final result = await repository.getNewsAll();
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
