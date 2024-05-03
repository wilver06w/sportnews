import 'package:dartz/dartz.dart';
import 'package:sportnews/src/features/home/data/data_sources/local/home_impl_api.dart';
import 'package:sportnews/src/features/home/data/data_sources/remote/home_impl_api.dart';
import 'package:sportnews/src/features/home/domain/entities/news_model.dart';
import 'package:sportnews/src/features/home/domain/repositories/abstract_home_repository.dart';
import 'package:sportnews/src/shared/utils/failures.dart';

class HomeRepositoryImpl extends AbstractHomeRepository {
  final HomeImplApiRemote apiRemote;
  final HomeImplApiLocal apiLocal;

  HomeRepositoryImpl({
    required this.apiRemote,
    required this.apiLocal,
  });

  @override
  Future<Either<Failure, List<NewsModels>>> getNewsAll() async {
    try {
      final getRemoteList = await apiRemote.getNewsAll();
      final getLocalList = await apiLocal.getDeleteList();

      // Crear un conjunto (Set) a partir de getLocalList para una búsqueda más eficiente
      final localListSet = getLocalList.toSet();

      // Quitar los elementos de getLocalList de la lista getRemoteList
      getRemoteList.removeWhere((element) => localListSet.contains(element));

      return Right(getRemoteList);
    } catch (e) {
      return const Left(ServerFailure('Error', 500));
    }
  }

  @override
  Future<Either<Failure, NewsModels>> setDeleteItem(
      NewsModels newsModels) async {
    try {
      final getLocalList = await apiLocal.setDeleteItems(newsModels);

      return Right(getLocalList);
    } catch (e) {
      return const Left(ServerFailure('Error', 500));
    }
  }
}
