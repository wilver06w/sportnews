import 'package:dartz/dartz.dart';
import 'package:sportnews/src/features/home/data/data_sources/remote/home_impl_api.dart';
import 'package:sportnews/src/features/home/domain/entities/news_model.dart';
import 'package:sportnews/src/features/home/domain/repositories/abstract_home_repository.dart';
import 'package:sportnews/src/shared/utils/failures.dart';

class HomeRepositoryImpl extends AbstractHomeRepository {
  final HomeImplApi articlesApi;

  HomeRepositoryImpl({
    required this.articlesApi,
  });

  @override
  Future<Either<Failure, List<NewsModels>>> getNewsAll() async {
    try {
      final result = await articlesApi.getNewsAll();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('Error', 500));
    }
  }
}
