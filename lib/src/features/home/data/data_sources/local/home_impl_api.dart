import 'package:sportnews/src/features/home/data/data_sources/local/abstract_home_api_remote.dart';
import 'package:sportnews/src/features/home/domain/entities/news_model.dart';

class HomeImplApiLocal extends AbstractHomeApiLocal {
  List<NewsModels> newsModelsList = [];

  ///Recibe el item a eliminar y lo addiciona a la lista.
  @override
  Future<NewsModels> setDeleteItems(NewsModels newsModelsItem) async {
    newsModelsList.add(newsModelsItem);
    return newsModelsItem;
  }

  ///Trae la data de los item eliminados.
  ///
  ///Devuelve la lista, de los items que han sido marcado eliminados
  @override
  Future<List<NewsModels>> getDeleteList() async {
    return newsModelsList;
  }
}
