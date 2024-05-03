import 'package:sportnews/src/features/home/domain/entities/news_model.dart';

abstract class AbstractHomeApiLocal {
  Future<List<NewsModels>> getDeleteList();
  Future<NewsModels> setDeleteItems(NewsModels newsModelsItem);
}
