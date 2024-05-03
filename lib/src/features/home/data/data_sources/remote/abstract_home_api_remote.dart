import 'package:sportnews/src/features/home/domain/entities/news_model.dart';

abstract class AbstractHomeApiRemote {
  Future<List<NewsModels>> getNewsAll();
}
