import 'package:dartz/dartz.dart';
import 'package:sportnews/src/features/home/domain/entities/news_model.dart';
import 'package:sportnews/src/features/home/domain/repositories/abstract_home_repository.dart';
import 'package:sportnews/src/shared/utils/failures.dart';
import 'package:sportnews/src/shared/utils/usecases/usecase.dart';

class DeleteNewsSportUseCase extends UseCase<NewsModels, NewsModels> {
  final AbstractHomeRepository repository;

  DeleteNewsSportUseCase({required this.repository});

  @override
  Future<Either<Failure, NewsModels>> call(NewsModels params) async {
    final result = await repository.setDeleteItem(params);
    return result.fold((l) {
      return Left(l);
    }, (r) async {
      return Right(r);
    });
  }
}
