import 'package:sportnews/src/features/home/data/data_sources/remote/abstract_home_api_remote.dart';
import 'package:sportnews/src/features/home/domain/entities/news_model.dart';

class HomeImplApiRemote extends AbstractHomeApiRemote {
  List<NewsModels> newsModels = [];

  HomeImplApiRemote() {
    for (int i = 0; i <= 4; i++) {
      int item = i + 1;
      newsModels.add(
        NewsModels(
          imageId: 'assets/img$item.jpg',
          title: 'Football players Kids $i',
          id: 0,
        ),
      );
    }
  }

  ///Trae la data de las noticias.
  ///
  ///Va al endpoint y trae la lista de noticias.
  @override
  Future<List<NewsModels>> getNewsAll() async {
    return newsModels;
  }
}
