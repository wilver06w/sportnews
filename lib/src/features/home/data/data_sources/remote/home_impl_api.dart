import 'package:sportnews/src/features/home/data/data_sources/remote/abstract_home_api.dart';
import 'package:sportnews/src/features/home/domain/entities/news_model.dart';

class HomeImplApi extends AbstractHomeApi {
  List<NewsModels> newsModels = [];

  HomeImplApi() {
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

  ///Trae la data de las razas.
  ///
  ///Va al endpoint y trae la lista de razas.
  @override
  Future<List<NewsModels>> getNewsAll() async {
    return newsModels;
  }
}
