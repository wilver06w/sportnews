import 'package:sportnews/src/features/home/domain/entities/news_model.dart';

abstract class AbstractHomeApi {
  Future<List<NewsModels>> getNewsAll();
}
