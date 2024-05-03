import 'package:dartz/dartz.dart';
import 'package:sportnews/src/features/home/domain/entities/news_model.dart';
import 'package:sportnews/src/shared/utils/failures.dart';

abstract class AbstractHomeRepository {
  Future<Either<Failure, List<NewsModels>>> getNewsAll();
  Future<Either<Failure, NewsModels>> setDeleteItem(NewsModels newsModels);
}
